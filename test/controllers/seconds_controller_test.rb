require 'test_helper'

class SecondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @second = seconds(:one)
  end

  test "should get index" do
    get seconds_url
    assert_response :success
  end

  test "should get new" do
    get new_second_url
    assert_response :success
  end

  test "should create second" do
    assert_difference('Second.count') do
      post seconds_url, params: { second: { datetimeSemanticZoomIn_id: @second.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @second.datetimeSemanticZoomOut_id, name: @second.name, second: @second.second, unixtime: @second.unixtime } }
    end

    assert_redirected_to second_url(Second.last)
  end

  test "should show second" do
    get second_url(@second)
    assert_response :success
  end

  test "should get edit" do
    get edit_second_url(@second)
    assert_response :success
  end

  test "should update second" do
    patch second_url(@second), params: { second: { datetimeSemanticZoomIn_id: @second.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @second.datetimeSemanticZoomOut_id, name: @second.name, second: @second.second, unixtime: @second.unixtime } }
    assert_redirected_to second_url(@second)
  end

  test "should destroy second" do
    assert_difference('Second.count', -1) do
      delete second_url(@second)
    end

    assert_redirected_to seconds_url
  end
end
