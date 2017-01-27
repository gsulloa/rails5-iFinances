require 'test_helper'

class EcategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ecategory_index_url
    assert_response :success
  end

  test "should get new" do
    get ecategory_new_url
    assert_response :success
  end

  test "should get create" do
    get ecategory_create_url
    assert_response :success
  end

  test "should get edit" do
    get ecategory_edit_url
    assert_response :success
  end

  test "should get update" do
    get ecategory_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ecategory_destroy_url
    assert_response :success
  end

end
