class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes
  has_many :voting_users, through: :votes

  # Validations
  validates :title, presence: true, length: { in: 6..30 }
  validates :text, presence: true, length: { minimum: 20 }
  validates :image, presence: true

  # Helpers
  def self.all_arts
    Article.all
  end

  def self.random
    Article.find(rand(1..Article.all.count))
  end
end
