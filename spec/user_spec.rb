require 'rails_helper'

# Test variables
name = 'mohameed'
short_name = 'mo'
RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: name)
    expect(user).to be_valid
  end

  it 'is not valid without name' do
    user = User.new
    expect(user).to_not be_valid
  end

  it 'is not valid with short name' do
    user = User.new(name: short_name)
    expect(user).to_not be_valid
  end
end
