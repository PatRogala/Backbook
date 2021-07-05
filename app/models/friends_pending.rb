class FriendsPending < ApplicationRecord
  validates :inviter_id, :invitee_id, presence: true

  belongs_to :inviter,
    primary_key: :id,
    foreign_key: :inviter_id,
    class_name: :User

  belongs_to :invitee,
    primary_key: :id,
    foreign_key: :invitee_id,
    class_name: :User
end
