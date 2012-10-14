class Referrer::Facebook < Referrer
  def css_class
    "facebook"
  end

  def script
    code = <<-eos
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '292279370880643',
          status     : true,
          cookie     : true,
          xfbml      : true,
        });

        FB.Event.subscribe('edge.create',
          function(response) {
            captureLike(response);
          }
        );

        FB.Event.subscribe('message.send',
          function(response) {
            captureShare(response);
          }
        );

        function captureLike(response) {
          var share_type = "like";
          makeCaptureCall(share_type);
        }

        function captureShare(response) {
          var share_type = "share";
          makeCaptureCall(share_type);
        }

        function makeCaptureCall(share_type) {
          var route = "sites/" + window.shareBeltSiteId + "/impressions/" + window.shareBeltImpressionId + "/click?network=facebook&type=" + share_type;
          var uri = "http://#{ENV["DOMAIN"]}/" + route;
          var script = document.createElement("script");
          script.setAttribute("src", uri);
          document.head.appendChild(script);
        }
      };

      (function (d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s);
          js.id = id;
          js.src = '//connect.facebook.net/en_US/all.js#xfbml=1&appId=292279370880643';
          fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));

    eos
    prepare_code(code)
  end

  def html
    "<div id='fb-root'></div><div class='fb-like' data-href='#{sharing}' data-send='true' data-width='450' data-show-faces='true' data-colorscheme='dark'></div>".html_safe
  end
end

