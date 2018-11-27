class Comment < ApplicationRecord
  belongs_to :topic
  validates :body, presence: true

  belongs_to :user
end
