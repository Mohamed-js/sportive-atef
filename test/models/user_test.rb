require 'test_helper'

class UserTest < ActiveSupport::TestCase
  User.delete_all
  test 'should not save user without name' do
    u = User.new
    assert_not u.save, 'Saved the user without a name'
  end
  test 'should not save user with so long name' do
    u1 = User.new
    u1.name = 'Mohammed atef wageeh abowaly mahmoud shereeeeeeef'
    assert_not u1.save, 'Saved the user without a 2..20 length name'
  end
  test 'should save user with 2..20 length name' do
    u2 = User.new
    u2.name = 'Mhammed wag'
    assert u2.save, "Didn't Save the user with a 2..20 length name"
  end
end
