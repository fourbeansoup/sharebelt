class Referrer
  def self.for(domain)
    if domain =~ /tco/
      Referrer::Twitter.new
    else
      Referrer::General.new
    end
  end
end
