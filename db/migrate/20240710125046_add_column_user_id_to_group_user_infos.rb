class AddColumnUserIdToGroupUserInfos < ActiveRecord::Migration[7.2]
  def change
    add_column :group_user_infos, :user_id, :integer
  end
end
