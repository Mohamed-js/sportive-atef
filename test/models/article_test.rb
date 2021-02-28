require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  Article.delete_all

  test 'should not save article without author_id' do
    article = Article.new
    article.category_id = 1
    assert_not article.save, 'Saved the article without an author_id'
  end

  test 'should not save article without category_id' do
    article = Article.new
    article.author_id = 1
    assert_not article.save, 'Saved the article without an category_id'
  end

  test 'should not save article without text' do
    article = Article.new
    article.author_id = 2
    article.category_id = 2
    article.title = '1234567'
    article.image = 'image.jpg'
    assert_not article.save, 'Saved the article without text'
  end

  test 'should not save article without title' do
    article = Article.new
    article.author_id = 3
    article.category_id = 3
    article.text = '1234567'
    article.image = 'image.jpg'
    assert_not article.save, 'Saved the article without title'
  end

  test 'should not save article with title less than 6 chars' do
    article = Article.new
    article.author_id = 4
    article.category_id = 4
    article.title = '12345'
    assert_not article.save, 'Saved the article without a 6..30 chars title length'
  end

  test 'should not save article with title more than 50 chars' do
    article = Article.new
    article.author_id = 5
    article.category_id = 5
    article.title = '1234567891011hdkjhsdljsaedfl;hasdf;hasdflkahsdfdkjdj'
    assert_not article.save, 'Saved the article without a 6..30 chars title length'
  end

  test 'should not save article with text less than 20 chars' do
    article = Article.new
    article.author_id = 6
    article.category_id = 6
    article.title = '12345asd'
    article.text = '1234567'
    article.image = 'image.jpg'
    assert_not article.save, 'Saved the article without a 20..250 chars title length'
  end
end
