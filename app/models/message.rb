class Message < ApplicationRecord
    validates :body, :group_id, :user_id, presence: true
    after_create_commit do
        group = Group.find_by(id: self.group_id)
        broadcast_append_to group, target: "messages"
    end
    belongs_to :user, primary_key: :id, foreign_key: :user_id
    belongs_to :group, primary_key: :id, foreign_key: :group_id
end