class ReferringUrl < ActiveRecord::Base
  has_many :impressions
  attr_accessible :url
end
