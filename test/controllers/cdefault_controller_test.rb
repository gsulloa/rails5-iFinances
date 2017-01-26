require 'test_helper'

class CdefaultControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cdefault_new_url
    assert_response :success
  end

  test "should get create" do
    get cdefault_create_url
    assert_response :success
  end

  test "should get edit" do
    get cdefault_edit_url
    assert_response :success
  end

  test "should get update" do
    get cdefault_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cdefault_destroy_url
    assert_response :success
  end

end
