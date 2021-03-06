require 'test_helper'

class ExpenseControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get expense_new_url
    assert_response :success
  end

  test "should get create" do
    get expense_create_url
    assert_response :success
  end

  test "should get edit" do
    get expense_edit_url
    assert_response :success
  end

  test "should get update" do
    get expense_update_url
    assert_response :success
  end

  test "should get destroy" do
    get expense_destroy_url
    assert_response :success
  end

end
