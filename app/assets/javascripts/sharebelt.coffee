class window.ShareBeltInjector

  window.loadResponse = (data) ->
    eval(data.script)
    belt = document.getElementById("sharebelt-wrapper") 
    belt.innerHTML = data.html
    belt.className += "visible"
    belt.className += " top"
    window.shareBeltSiteId = data.site
    window.shareBeltImpressionId = data.impression

  window.closeSharebelt = ->
    sharebelt = document.getElementById('sharebelt-wrapper')
    sharebelt.innerHTML = ""

  buildUri: (d) -> 
    referrer = @stripProtocol(d.referrer) 
    domain = "sharebelt.com" 
    #domain = "localhost:3000"
    #referrer = "t.co"
    #referrer = "facebook"
    location = d.location.href
    site_id = d.getElementById('sharebelt-wrapper').getAttribute('data-site')
    if referrer then "http://#{domain}/sites/#{site_id}/impressions?referrer=" + referrer + "&location=" + location + "&jsonp=loadResponse" else ""
      
  injectScript: (d) -> 
    script = d.createElement("script")
    script.setAttribute("src", @buildUri(d))
    d.head.appendChild(script)

  stripProtocol: (referrer) ->
    if referrer.indexOf("https://") == 0
      return referrer.substring(8)
    if referrer.indexOf("http://" == 0)
      return referrer.substring(7)
