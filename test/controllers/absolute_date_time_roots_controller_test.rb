require 'test_helper'

class AbsoluteDateTimeRootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @absolute_date_time_root = absolute_date_time_roots(:one)
  end

  test "should get index" do
    get absolute_date_time_roots_url
    assert_response :success
  end

  test "should get new" do
    get new_absolute_date_time_root_url
    assert_response :success
  end

  test "should create absolute_date_time_root" do
    assert_difference('AbsoluteDateTimeRoot.count') do
      post absolute_date_time_roots_url, params: { absolute_date_time_root: { name: @absolute_date_time_root.name } }
    end

    assert_redirected_to absolute_date_time_root_path(AbsoluteDateTimeRoot.last)
  end

  test "should show absolute_date_time_root" do
    get absolute_date_time_root_url(@absolute_date_time_root)
    assert_response :success
  end

  test "should get edit" do
    get edit_absolute_date_time_root_url(@absolute_date_time_root)
    assert_response :success
  end

  test "should update absolute_date_time_root" do
    patch absolute_date_time_root_url(@absolute_date_time_root), params: { absolute_date_time_root: { name: @absolute_date_time_root.name } }
    assert_redirected_to absolute_date_time_root_path(@absolute_date_time_root)
  end

  test "should destroy absolute_date_time_root" do
    assert_difference('AbsoluteDateTimeRoot.count', -1) do
      delete absolute_date_time_root_url(@absolute_date_time_root)
    end

    assert_redirected_to absolute_date_time_roots_path
  end
end
