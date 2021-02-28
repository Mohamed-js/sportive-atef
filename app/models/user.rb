class User < ApplicationRecord
  has_many :articles, foreign_key: 'author_id', class_name: 'Article'
  has_many :votes
  has_many :voted_articles, through: :votes

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { in: 3..20 }
end
