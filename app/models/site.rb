class Site < ActiveRecord::Base
  belongs_to :user
  has_many :impressions, :depedant => :destroy
  attr_accessible :name
end
