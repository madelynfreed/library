require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "Post returns error if email isn't provided" do
    post "/request", params: { title: 'Non existant book'}
    assert_equal 400, status
  end

  test "Post returns error if title isn't provided" do
    post "/request", params: { email: 'some@email.com' }
    assert_equal 400, status
  end

  test "Post returns success if book is available" do
    post "/request", params: { email: "some@email.com", title: 'Ghost World'}
    assert_response :success
  end

  test "Post returns data if book is available" do
    post "/request", params: { email: "some@email.com", title: 'Ghost World'}
    assert_equal(response.parsed_body["id"], 1)
    assert_equal(response.parsed_body["available"], true)
    assert_equal(response.parsed_body["title"], "Ghost World")
  end
end
