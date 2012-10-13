class Referrer::Direct < Referrer
  def css_class
    "direct"
  end

  def script
    ""
  end

  def html
    "Direct"
  end
end
