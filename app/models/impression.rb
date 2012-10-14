class Impression < ActiveRecord::Base
  belongs_to :site
  before_create :set_timestamps

  def set_timestamps
    self.viewed_at = self.viewed_on = Time.now
  end
end
