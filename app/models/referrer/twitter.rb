class Referrer::Twitter < Referrer
  def css_class
    "twitter"
  end

  def script
    code = <<-eos
      window.twttr = (function (d,s,id) {
        var t, js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return; js=d.createElement(s); js.id=id;
        js.src='//platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs);
        return window.twttr || (t = { _e: [], ready: function(f){ t._e.push(f) } });
      }(document, 'script', 'twitter-wjs'));

      twttr.ready(function (twttr) {
        twttr.events.bind('click', captureClick);
        twttr.events.bind('tweet', captureTweet);
      });

      function captureClick(intent_event) {
        if (intent_event) {
          var share_type = "tweet";
          makeCaptureCall(share_type);
        };
      }

      function captureTweet(intent_event) {
        if (intent_event) {
          var share_type = "click";
          makeCaptureCall(share_type);
        };
      }

      function makeCaptureCall(share_type) {
        var route = "site/" + window.shareBeltSiteId + "/impressions/" + window.shareBeltImpressionId + "/click?network=twitter&type=" + share_type;
        var uri = "http://#{ENV["DOMAIN"]}/" + route;
        var script = document.createElement("script");
        script.setAttribute("src", uri);
        document.head.appendChild(script);
      }
    eos
    prepare_code(code)
  end

  def html
    "I see you came from twitter. If you like this, <a href='https://twitter.com/share' class='twitter-share-button' data-url='#{sharing}' data-via='sharebelt' data-size='large' data-count='none'>Tweet it</a>?".html_safe
  end
end

