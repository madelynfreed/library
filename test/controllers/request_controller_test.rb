require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "Post returns error if requesting an unavailable book" do
    post "/request", params: { email: 'some@email.com', title: 'Watchmen'}
    assert_equal 400, status
  end
end
