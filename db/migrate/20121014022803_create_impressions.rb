class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.belongs_to :site
      t.datetime :viewed_at
      t.date :viewed_on

      t.timestamps
    end
    add_index :impressions, :site_id
  end
end
