class AddScreenNameToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :screen_name, :string
  end
end
