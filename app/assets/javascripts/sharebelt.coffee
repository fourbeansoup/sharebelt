window.loadResponse = (data) ->
  eval(data.script)
  belt = document.getElementById("sharebelt-wrapper") 
  belt.innerHTML = data.html

buildUri = -> 
  domain = "sharebelt.com" 
  #domain = "localhost:3000" 
  referrer = strip_protocol(document.referrer) 
  location = document.location.href
  "http://#{domain}/impressions?referrer=" + referrer + "&location=" + location + "&jsonp=loadResponse"

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
