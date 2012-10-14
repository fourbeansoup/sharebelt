class Site < ActiveRecord::Base
  belongs_to :user
  has_many :impressions, :dependent => :destroy
  attr_accessible :name
end
