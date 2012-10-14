class CreateReferringUrls < ActiveRecord::Migration
  def change
    create_table :referring_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
