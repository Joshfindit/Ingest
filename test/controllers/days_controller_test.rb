require 'test_helper'

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:one)
  end

  test "should get index" do
    get days_url
    assert_response :success
  end

  test "should get new" do
    get new_day_url
    assert_response :success
  end

  test "should create day" do
    assert_difference('Day.count') do
      post days_url, params: { day: { datetimeSemanticZoomIn_id: @day.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @day.datetimeSemanticZoomOut_id, day: @day.day, name: @day.name, normalized_name: @day.normalized_name } }
    end

    assert_redirected_to day_path(Day.last)
  end

  test "should show day" do
    get day_url(@day)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_url(@day)
    assert_response :success
  end

  test "should update day" do
    patch day_url(@day), params: { day: { datetimeSemanticZoomIn_id: @day.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @day.datetimeSemanticZoomOut_id, day: @day.day, name: @day.name, normalized_name: @day.normalized_name } }
    assert_redirected_to day_path(@day)
  end

  test "should destroy day" do
    assert_difference('Day.count', -1) do
      delete day_url(@day)
    end

    assert_redirected_to days_path
  end
end
