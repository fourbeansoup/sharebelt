class Referrer::Facebook < Referrer
  def css_class
    "facebook"
  end

  def script
    "(function(d, s, id) {var js, fjs = d.getElementsByTagName(s)[0];if (d.getElementById(id)) return;js = d.createElement(s); js.id = id;js.src = '//connect.facebook.net/en_US/all.js#xfbml=1&appId=292279370880643';fjs.parentNode.insertBefore(js, fjs);}(document, 'script', 'facebook-jssdk'));".html_safe
  end

  def html
    "<div id='fb-root'></div><div class='fb-like' data-href='#{sharing}' data-send='true' data-width='450' data-show-faces='true'></div>".html_safe
  end
end

