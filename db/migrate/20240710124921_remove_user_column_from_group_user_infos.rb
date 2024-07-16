class RemoveUserColumnFromGroupUserInfos < ActiveRecord::Migration[7.2]
  def change
    remove_column :group_user_infos, :user, :string
  end
end
