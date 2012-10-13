class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.belongs_to :user

      t.timestamps
    end
    add_index :sites, :user_id
  end
end
