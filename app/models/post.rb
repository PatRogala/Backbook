class Post < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments
end
