require 'test_helper'

class ReadersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get readers_index_url
    assert_response :success
  end

  test "should get new" do
    get readers_new_url
    assert_response :success
  end

  test "should get create" do
    get readers_create_url
    assert_response :success
  end

  test "should get edit" do
    get readers_edit_url
    assert_response :success
  end

  test "should get show" do
    get readers_show_url
    assert_response :success
  end

  test "should get update" do
    get readers_update_url
    assert_response :success
  end

  test "should get delete" do
    get readers_delete_url
    assert_response :success
  end

end
