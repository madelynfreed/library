require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "Post returns error if requesting an unavailable book" do
    post "/request", params: { email: 'some@email.com', title: 'Watchmen'}
    assert_equal 400, status
  end

  test "Post returns success if book is available" do
    post "/request", params: { email: "some@email.com", title: 'Ghost World'}
    assert_equal 200, status
  end
end
