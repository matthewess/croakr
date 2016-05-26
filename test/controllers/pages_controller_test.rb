require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "croakr"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "about | croakr"
  end

  test "should get signin" do
    get :signin
    assert_response :success
    assert_select "title", "sign-in | croakr"
  end

  test "should get splash" do
    get :splash
    assert_response :success
    assert_select "title", "welcome | croakr"
  end

end
