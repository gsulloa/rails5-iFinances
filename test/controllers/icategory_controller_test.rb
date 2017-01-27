require 'test_helper'

class IcategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get icategory_index_url
    assert_response :success
  end

  test "should get new" do
    get icategory_new_url
    assert_response :success
  end

  test "should get create" do
    get icategory_create_url
    assert_response :success
  end

  test "should get edit" do
    get icategory_edit_url
    assert_response :success
  end

  test "should get update" do
    get icategory_update_url
    assert_response :success
  end

  test "should get destroy" do
    get icategory_destroy_url
    assert_response :success
  end

end
