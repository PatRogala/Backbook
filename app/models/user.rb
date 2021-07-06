class User < ApplicationRecord
  has_many :friends_pendings, class_name: "FriendsPending", foreign_key: :invitee_id
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :sex, presence: true
  validates :sex, inclusion: { in: %w(F M) }
end
