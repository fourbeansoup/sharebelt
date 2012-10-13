// Generated by CoffeeScript 1.3.3
(function() {
  var buildUri, injectScript, strip_protocol;

  window.loadResponse = function(data) {
    var belt;
    eval(data.script);
    belt = document.getElementById("sharebelt-wrapper");
    return belt.innerHTML = data.html;
  };

  buildUri = function() {
    var domain, referrer;
    domain = "sharebelt.com";
    referrer = strip_protocol(document.referrer);
    return ("http://" + domain + "/impressions?referrer=") + referrer + "&jsonp=loadResponse";
  };

  injectScript = function() {
    var script;
    script = document.createElement("script");
    script.setAttribute("src", buildUri());
    return document.head.appendChild(script);
  };

  strip_protocol = function(referrer) {
    if (referrer.indexOf("https://") === 0) {
      referrer.substring(8);
    }
    if (referrer.indexOf("http://" === 0)) {
      return referrer.substring(7);
    }
  };

  injectScript();

}).call(this);
