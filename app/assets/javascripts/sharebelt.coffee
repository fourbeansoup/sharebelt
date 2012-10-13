loadResponse = (data) ->
  data

buildUri = -> 
  domain = "localhost:3000" 
  referrer = strip_protocol(document.referrer) 
  "http://#{domain}/impressions?referrer=" + referrer + "&jsonp=loadResponse"

injectScript = -> 

  script = document.createElement("script")
  script.setAttribute("src", buildUri())
  document.head.appendChild(script)

strip_protocol = (referrer) ->
  if referrer.indexOf("https://") == 0
    referrer.substring(8)
  if referrer.indexOf("http://" == 0)
    referrer.substring(7)

injectScript()
