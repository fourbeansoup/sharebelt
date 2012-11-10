class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :impression_id
      t.timestamps
    end
  end
end
