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
    eos
    prepare_code(code)
  end

  def html
    "I see you came from twitter. If you like this, <a href='https://twitter.com/share' class='twitter-share-button' data-url='#{sharing}' data-via='sharebelt' data-size='large' data-count='none'>Tweet it</a>?".html_safe
  end
end

