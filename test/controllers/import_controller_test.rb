require 'test_helper'

class ImportControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get import_new_url
    assert_response :success
  end

end
