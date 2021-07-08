class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[facebook]
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

  #after_create :welcome_email <-- only localhost need configuration for heroku

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      puts "|\n|\n|#{auth}\n|\n|\n|"
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      name = auth.info.name.split(" ")
      user.first_name = name[0] # assuming the user model has a name
      user.last_name = name[1]
      user.sex = user.first_name.end_with?('a') ? "F" : "M"
    end
  end

  def welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
