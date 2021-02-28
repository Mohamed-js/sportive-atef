class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  # Validations
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :article_id, presence: true, numericality: { only_integer: true }

  # Helpers

  def self.top_count
    Vote.group(:article_id).count.map { |art| art[1] }.sort.max
  end

  def self.count_key_pair
    Vote.group(:article_id).count.map { |art| [art[1], art[0]] }
  end

  def self.top_art
    top_count = Vote.top_count
    count_id_key = Vote.count_key_pair
    top_id = count_id_key.select { |key_id_pair| key_id_pair[0] == top_count }
    unless top_id[0].nil?
      @top_article = Article.find(top_id[0][1])
      @top_article
    end
  end
end
