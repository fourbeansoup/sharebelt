#=require sharebelt

describe "ShareBeltInjector", ->

  sbj = new ShareBeltInjector
  siteId = "1"

  locationStub = -> 
    { href: "myblog.com" }
  elementStub = -> 
    { getAttribute: -> siteId }
  documentStub = (referrer) -> 
    {
      referrer: referrer, 
      location: location, 
      getElementById: -> elementStub(),
    }
  location = locationStub()

  describe "buildURI without a referrer", ->
    it "should provide no uri to call", ->
      d = documentStub("")
      expect(sbj.buildUri(d)).toEqual("")

  describe "buildURI with a referrer", ->
    referrer = "http://t.co/sJkWjLy"
    d = documentStub(referrer)
    uri = sbj.buildUri(d)

    it "should provide a uri to call", ->
      expect(uri).not.toEqual("")
    it "call should include the referrer", -> 
      expect(uri).toMatch("t.co/sJkWjLy")
    it "call should include the referrer", -> 
      expect(uri).toMatch(location)
    it "call should include the site id", -> 
      expect(uri).toMatch(siteId)

   describe "stripProtocol", ->
     it "should remove http", ->
       expect(sbj.stripProtocol("http://abc.def")).toEqual("abc.def")
     it "should remove https", ->
       expect(sbj.stripProtocol("https://abc.def")).toEqual("abc.def")
