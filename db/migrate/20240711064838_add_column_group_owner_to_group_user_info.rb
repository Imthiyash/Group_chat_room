class AddColumnGroupOwnerToGroupUserInfo < ActiveRecord::Migration[7.2]
  def change
    add_column :group_user_infos, :group_owner, :integer
  end
end
