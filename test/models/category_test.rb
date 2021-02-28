require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  Category.delete_all
  test 'should not save category without name' do
    cat = Category.new
    cat.priority = 1
    assert_not cat.save, 'Saved the category without a name'
  end

  test 'should not save category without numeric priority' do
    cat = Category.new
    cat.priority = 'one'
    cat.name = 'article naa2sme'
    assert_not cat.save, 'Saved the category without a numeric priority'
  end

  test 'should not save category with short names' do
    cat = Category.new
    cat.priority = 2
    cat.name = 'a'
    assert_not cat.save, 'Saved the category with short name'
  end

  test 'should not save category without priority' do
    cat = Category.new
    cat.name = 'article namee'
    assert_not cat.save, 'Saved the category without a priority'
  end

  test 'should save category with priority and name' do
    cat = Category.new
    cat.name = 'na ticle nam23esd'
    cat.priority = 3
    assert cat.save, "Didn't save the category"
  end
end
