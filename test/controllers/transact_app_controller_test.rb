require 'test_helper'

class TransactAppControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get transact_app_home_url
    assert_response :success
  end

  test 'should get help' do
    get transact_app_help_url
    assert_response :success
  end

  test 'should get about' do
    get transact_app_about_url
    assert_response :success
  end
end
