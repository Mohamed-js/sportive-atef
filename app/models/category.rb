class Category < ApplicationRecord
  has_many :articles

  # Validations
  validates :name, presence: true, length: { in: 3..20 }
  validates :priority, presence: true, numericality: { only_integer: true }

  # Helpers

  def self.all_asc
    Category.all.order(priority: 'asc')
  end

  def self.voted(user, art)
    if art.votes.select { |x| x.user_id == user }.empty?
      "<a class='text-right d-block orange' href='/votes/vote_up/#{art.id}'><div class='divo'><h4 class='m-0'><i class='fas fa-caret-square-up'></i></h4><strong><h6>UP VOTE</h6></strong></div></a>"
    else
      '<p class="btn voted">Voted</p>'
    end
  end
end
