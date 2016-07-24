require 'test_helper'

class MonthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @month = months(:one)
  end

  test "should get index" do
    get months_url
    assert_response :success
  end

  test "should get new" do
    get new_month_url
    assert_response :success
  end

  test "should create month" do
    assert_difference('Month.count') do
      post months_url, params: { month: { datetimeSemanticZoomIn_id: @month.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @month.datetimeSemanticZoomOut_id, month: @month.month, name: @month.name, normalized_name: @month.normalized_name } }
    end

    assert_redirected_to month_path(Month.last)
  end

  test "should show month" do
    get month_url(@month)
    assert_response :success
  end

  test "should get edit" do
    get edit_month_url(@month)
    assert_response :success
  end

  test "should update month" do
    patch month_url(@month), params: { month: { datetimeSemanticZoomIn_id: @month.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @month.datetimeSemanticZoomOut_id, month: @month.month, name: @month.name, normalized_name: @month.normalized_name } }
    assert_redirected_to month_path(@month)
  end

  test "should destroy month" do
    assert_difference('Month.count', -1) do
      delete month_url(@month)
    end

    assert_redirected_to months_path
  end
end
