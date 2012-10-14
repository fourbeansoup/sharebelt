class AddClickedToImpression < ActiveRecord::Migration
  def change
    add_column :impressions, :clicked, :boolean
  end
end
