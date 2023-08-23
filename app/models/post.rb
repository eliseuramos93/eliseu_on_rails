class Post < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, length: { minimum: 1 }
  validates :body, length: { minimum: 10 }

  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
