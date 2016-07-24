require 'test_helper'

class DecadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decade = decades(:one)
  end

  test "should get index" do
    get decades_url
    assert_response :success
  end

  test "should get new" do
    get new_decade_url
    assert_response :success
  end

  test "should create decade" do
    assert_difference('Decade.count') do
      post decades_url, params: { decade: { datetimeSemanticZoomIn_id: @decade.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @decade.datetimeSemanticZoomOut_id, decade: @decade.decade, name: @decade.name, normalized_name: @decade.normalized_name } }
    end

    assert_redirected_to decade_path(Decade.last)
  end

  test "should show decade" do
    get decade_url(@decade)
    assert_response :success
  end

  test "should get edit" do
    get edit_decade_url(@decade)
    assert_response :success
  end

  test "should update decade" do
    patch decade_url(@decade), params: { decade: { datetimeSemanticZoomIn_id: @decade.datetimeSemanticZoomIn_id, datetimeSemanticZoomOut_id: @decade.datetimeSemanticZoomOut_id, decade: @decade.decade, name: @decade.name, normalized_name: @decade.normalized_name } }
    assert_redirected_to decade_path(@decade)
  end

  test "should destroy decade" do
    assert_difference('Decade.count', -1) do
      delete decade_url(@decade)
    end

    assert_redirected_to decades_path
  end
end
