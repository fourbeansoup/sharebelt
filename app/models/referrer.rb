class Referrer
  attr_accessor :domain

  def initialize(domain)
    @domain = domain.blank? ? "none" : domain
  end

  def self.for(domain)
    if domain =~ /t\.co/
      Referrer::Twitter.new(domain)
    else
      Referrer::Direct.new(domain)
    end
  end

end
