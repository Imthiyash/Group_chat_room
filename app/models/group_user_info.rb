class GroupUserInfo < ApplicationRecord
    validates :group_name, :user_id, presence: true
    after_create_commit do
        user = User.find_by(id: self.user_id)
        broadcast_append_to user, target: "groups"
        # broadcast_append_to group, target: "participants", partial: "group_user_infos/participant"
    end
    belongs_to :user, primary_key: :id, foreign_key: :user_id
    belongs_to :group, primary_key: :group_name, foreign_key: :group_name
end