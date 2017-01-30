require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loans_index_url
    assert_response :success
  end

  test "should get lend" do
    get loans_lend_url
    assert_response :success
  end

  test "should get lend_me" do
    get loans_lend_me_url
    assert_response :success
  end

  test "should get create" do
    get loans_create_url
    assert_response :success
  end

  test "should get finish" do
    get loans_finish_url
    assert_response :success
  end

end
