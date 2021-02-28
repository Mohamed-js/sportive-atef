require 'rails_helper'

# Test variables
unless author = User.first
  author = User.new(name: 'mohammed')
  author.save
end
unless category = Category.first
  category = Category.new(name: 'cat', priority: 1)
  category.save
end
title = 'Hello new world'
short_title = 'as'
text = 'This is testing text and it should be quite long to be valid'
short_text = 'adsfd'
image = 'car.png'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    article = author.articles.build(category_id: category.id, title: title, text: text, image: image)
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = author.articles.build(category_id: category.id, text: text, image: image)
    expect(article).to_not be_valid
  end

  it 'is not valid with a short title' do
    article = author.articles.build(category_id: category.id, text: text, title: short_title, image: image)
    expect(article).to_not be_valid
  end

  it 'is not valid without a text' do
    article = author.articles.build(category_id: category.id, title: title, image: image)
    expect(article).to_not be_valid
  end

  it 'is not valid with a short text' do
    article = author.articles.build(category_id: category.id, text: short_text, title: title, image: image)
    expect(article).to_not be_valid
  end

  it 'is not valid without an image' do
    article = author.articles.build(category_id: category.id, title: title, text: text)
    expect(article).to_not be_valid
  end

  it 'is not valid without an author' do
    article = Article.new(category_id: category.id, title: title, text: text, image: image)
    expect(article).to_not be_valid
  end

  it 'is not valid without a category' do
    article = Article.new(author_id: author.id, title: title, text: text, image: image)
    expect(article).to_not be_valid
  end
end
