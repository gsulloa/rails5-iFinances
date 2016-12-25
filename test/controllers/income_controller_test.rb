require 'test_helper'

class IncomeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get income_new_url
    assert_response :success
  end

  test "should get create" do
    get income_create_url
    assert_response :success
  end

  test "should get edit" do
    get income_edit_url
    assert_response :success
  end

  test "should get update" do
    get income_update_url
    assert_response :success
  end

  test "should get delete" do
    get income_delete_url
    assert_response :success
  end

end
