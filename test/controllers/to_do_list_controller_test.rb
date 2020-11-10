require 'test_helper'

class ToDoListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get to_do_list_index_url
    assert_response :success
  end

end
