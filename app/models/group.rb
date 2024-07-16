class Group < ApplicationRecord
    validates :group_name, :group_owner, presence: true
    validates :group_name, uniqueness: true
    has_many :group_user_infos
end
