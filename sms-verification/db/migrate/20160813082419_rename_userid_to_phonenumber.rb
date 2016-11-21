class RenameUseridToPhonenumber < ActiveRecord::Migration
  def change
    rename_column :phone_numbers, :userid, :user_id
  end
end
