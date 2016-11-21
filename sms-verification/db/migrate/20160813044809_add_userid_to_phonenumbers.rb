class AddUseridToPhonenumbers < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :userid, :integer
  end
end
