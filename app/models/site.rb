class Site < ActiveRecord::Base
  belongs_to :user
  has_many :impressions, :dependent => :destroy
  attr_accessible :name

  def graph_data
    impression_totals = impressions.group(:viewed_on).order(:viewed_on).count
    click_totals = impressions.where(clicked:true).group(:viewed_on).order(:viewed_on).count
    impression_values = []
    click_values = []
    impression_totals.each do |date,impression_count|
      click_count = click_totals[date]
      click_count = 0 unless click_count
      impression_values << { x: date, y:impression_count }
      click_values << { x: date, y:click_count }
    end
    [
      {
        key: "Impressions",
        values: impression_values,
      },
      {
        key: "Clicks", 
        values: click_values,
      },
    ]
  end
end
