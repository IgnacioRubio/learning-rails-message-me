require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new
  end

  test "should not validate message without body" do
    @message.valid?

    assert_includes(@message.errors.details[:body], {:error=>:blank})    
  end

  test "should not valdiate message without user" do
    @message.valid?
    
    assert_includes(@message.errors.details[:user], {:error=>:blank}) 
  end
end
