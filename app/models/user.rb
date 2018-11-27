class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  # def favorite_topics
  #   @favorite_topics = []
  #   Favorite.where(user_id: self.id).each do |favorite|
  #     @favorite_topics << Topic.find_by(id: favorite.topic_id)
  #   end
  # end

  has_many :comments
end
