require 'test_helper'

class MillisecondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @millisecond = milliseconds(:one)
  end

  test "should get index" do
    get milliseconds_url
    assert_response :success
  end

  test "should get new" do
    get new_millisecond_url
    assert_response :success
  end

  test "should create millisecond" do
    assert_difference('Millisecond.count') do
      post milliseconds_url, params: { millisecond: { datetimeSemanticZoomOut_id: @millisecond.datetimeSemanticZoomOut_id, millisecond: @millisecond.millisecond, name: @millisecond.name } }
    end

    assert_redirected_to millisecond_url(Millisecond.last)
  end

  test "should show millisecond" do
    get millisecond_url(@millisecond)
    assert_response :success
  end

  test "should get edit" do
    get edit_millisecond_url(@millisecond)
    assert_response :success
  end

  test "should update millisecond" do
    patch millisecond_url(@millisecond), params: { millisecond: { datetimeSemanticZoomOut_id: @millisecond.datetimeSemanticZoomOut_id, millisecond: @millisecond.millisecond, name: @millisecond.name } }
    assert_redirected_to millisecond_url(@millisecond)
  end

  test "should destroy millisecond" do
    assert_difference('Millisecond.count', -1) do
      delete millisecond_url(@millisecond)
    end

    assert_redirected_to milliseconds_url
  end
end
