class Impression < ActiveRecord::Base
  belongs_to :site
  attr_accessible :viewed_at, :viewed_on
end
