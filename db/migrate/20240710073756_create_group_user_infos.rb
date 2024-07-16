class CreateGroupUserInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :group_user_infos do |t|
      t.string :group_name
      t.string :user

      t.timestamps
    end
  end
end
