class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

# パスワード文字数　8~32文字
  validates :password, length: {minimum: 8, maximum: 32 }
  validates :password_confirmation, length: {minimum: 8, maximum: 32 }

#パスワードをアルファベット、数字の混合のみ可能
  validates :password, format: { with: /\A[a-z\d]{8,100}+\z/i }

#メアド正規表現「~ @ ~ . ~」の形を許可。uniqueness⇨重複してないか
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

#名前の長さ15文字まで
  validates :name, length: {maximum: 15}

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

  has_many :comments
  # has_many :comment_topics,through: :comments, sourse: 'topic'
end
