require 'test_helper'

class GeospatialNodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geospatial_node = geospatial_nodes(:one)
  end

  test "should get index" do
    get geospatial_nodes_url
    assert_response :success
  end

  test "should get new" do
    get new_geospatial_node_url
    assert_response :success
  end

  test "should create geospatial_node" do
    assert_difference('GeospatialNode.count') do
      post geospatial_nodes_url, params: { geospatial_node: { geospatialOccurredAt_id: @geospatial_node.geospatialOccurredAt_id, geospatialRecordedAt_id: @geospatial_node.geospatialRecordedAt_id, geospatialSemanticZoomIn_id: @geospatial_node.geospatialSemanticZoomIn_id, geospatialSemanticZoomOut_id: @geospatial_node.geospatialSemanticZoomOut_id, latitude: @geospatial_node.latitude, longitude: @geospatial_node.longitude, name: @geospatial_node.name } }
    end

    assert_redirected_to geospatial_node_url(GeospatialNode.last)
  end

  test "should show geospatial_node" do
    get geospatial_node_url(@geospatial_node)
    assert_response :success
  end

  test "should get edit" do
    get edit_geospatial_node_url(@geospatial_node)
    assert_response :success
  end

  test "should update geospatial_node" do
    patch geospatial_node_url(@geospatial_node), params: { geospatial_node: { geospatialOccurredAt_id: @geospatial_node.geospatialOccurredAt_id, geospatialRecordedAt_id: @geospatial_node.geospatialRecordedAt_id, geospatialSemanticZoomIn_id: @geospatial_node.geospatialSemanticZoomIn_id, geospatialSemanticZoomOut_id: @geospatial_node.geospatialSemanticZoomOut_id, latitude: @geospatial_node.latitude, longitude: @geospatial_node.longitude, name: @geospatial_node.name } }
    assert_redirected_to geospatial_node_url(@geospatial_node)
  end

  test "should destroy geospatial_node" do
    assert_difference('GeospatialNode.count', -1) do
      delete geospatial_node_url(@geospatial_node)
    end

    assert_redirected_to geospatial_nodes_url
  end
end
