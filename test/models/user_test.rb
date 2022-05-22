require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new
  end

  test "should not validate user without username" do
    @user.valid?

    assert_includes(@user.errors.details[:username], {:error=>:blank})
  end

  test "should not validate user with repit username" do
    @user.username = 'rand'
    @user.valid?
    
    assert_includes(@user.errors.details[:username], {:error=>:taken, :value=>"rand"})
  end

  test "should not validate user without minimum length" do
    @user.username = 'a'
    @user.valid?
    
    assert_includes(@user.errors.details[:username], {:error=>:too_short, :count=>3})
  end

  test "should not validate user without maximum length" do
    @user.username = 'a'*16
    @user.valid?
    
    assert_includes(@user.errors.details[:username], {:error=>:too_long, :count=>15})
  end
end
