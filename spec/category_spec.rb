require 'rails_helper'

# Test variables
prior = 1
name = 'cat name'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    cat = Category.new(priority: prior, name: name)
    expect(cat).to be_valid
  end

  it 'is not valid without priority' do
    cat = Category.new(name: name)
    expect(cat).to_not be_valid
  end

  it 'is not valid without name' do
    cat = Category.new(priority: prior)
    expect(cat).to_not be_valid
  end
end
