require 'test_helper'

class FsubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fsubscriptions_index_url
    assert_response :success
  end

  test "should get show" do
    get fsubscriptions_show_url
    assert_response :success
  end

  test "should get edit" do
    get fsubscriptions_edit_url
    assert_response :success
  end

  test "should get create" do
    get fsubscriptions_create_url
    assert_response :success
  end

  test "should get update" do
    get fsubscriptions_update_url
    assert_response :success
  end

  test "should get new" do
    get fsubscriptions_new_url
    assert_response :success
  end

  test "should get destroy" do
    get fsubscriptions_destroy_url
    assert_response :success
  end

end
