require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get inde" do
    get pages_inde_url
    assert_response :success
  end

end
