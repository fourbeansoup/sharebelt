class Referrer
  attr_accessor :referring, :sharing

  def initialize(referring,sharing)
    @referring = referring.blank? ? "" : referring
    @sharing = sharing.blank? ? "" : sharing
  end

  def self.for(referring,sharing)
    if referring =~ /t\.co/
      Referrer::Twitter.new(referring,sharing)
    elsif referring =~ /facebook/
      Referrer::Facebook.new(referring,sharing)
    end
  end

end
