class Referrer::Twitter < Referrer
  def css_class
    "twitter"
  end

  def script
    "!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='//platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','twitter-wjs');".html_safe
  end
  
  def html
    "<a href='https://twitter.com/share' class='twitter-share-button' data-via='sharebelt' data-size='large' data-count='none'>Tweet</a>".html_safe
  end
end

