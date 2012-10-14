class Impression < ActiveRecord::Base
  belongs_to :site
  belongs_to :landing_url
  belongs_to :referring_url

  attr_accessible :site, :landing_url, :referring_url

  before_create :set_timestamps

  def click!
    self.update_attribute(:clicked, true)
  end

  def landing_url=(url)
    matching_landing_url = LandingUrl.find_or_create_by_url(url)
    super(matching_landing_url)
  end

  def referring_url=(url)
    matching_referring_url = ReferringUrl.find_or_create_by_url(url)
    super(matching_referring_url)
  end

  def set_timestamps
    self.viewed_at = self.viewed_on = Time.now
  end
end
