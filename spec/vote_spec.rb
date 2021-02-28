require 'rails_helper'

# Test variables
unless author = User.first
  author = User.new(name: 'mohammed')
  author.save
end

unless article = Article.first
  unless category = Category.first
    category = Category.new(name: 'cat', priority: 1)
    category.save
  end
  title = 'Hello new world'
  text = 'This is testing text and it should be quite long to be valid'
  image = 'car.png'
  article = author.articles.build(category_id: category.id, title: title, text: text, image: image)
  article.save
end

RSpec.describe Vote, type: :model do
  it 'is valid with valid attributes' do
    vote = author.votes.build(article_id: article.id)
    expect(vote).to be_valid
  end

  it 'is not valid without article id' do
    vote = author.votes.build
    expect(vote).to_not be_valid
  end

  it 'is not valid without user id' do
    vote = Vote.new(article_id: article.id)
    expect(vote).to_not be_valid
  end
end
