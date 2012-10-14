class window.ShareBeltInjector

  window.loadResponse = (data) ->
    eval(data.script)
    belt = document.getElementById("sharebelt-wrapper") 
    belt.innerHTML = data.html

  buildUri: (d) -> 
    domain = "sharebelt.com" 
    #domain = "localhost:3000" 
    referrer = @stripProtocol(d.referrer) 
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
