class CreateLandingUrls < ActiveRecord::Migration
  def change
    create_table :landing_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
