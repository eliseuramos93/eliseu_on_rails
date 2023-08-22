class Post < ApplicationRecord
  validates :title, :body, :tags, presence: true
  validates :title, length: { minimum: 1 }
  validates :body, length: { minimum: 10 }
end
