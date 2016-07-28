require 'test_helper'

class AbsoluteDateNodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @absolute_date_node = absolute_date_nodes(:one)
  end

  test "should get index" do
    get absolute_date_nodes_url
    assert_response :success
  end

  test "should get new" do
    get new_absolute_date_node_url
    assert_response :success
  end

  test "should create absolute_date_node" do
    assert_difference('AbsoluteDateNode.count') do
      post absolute_date_nodes_url, params: { absolute_date_node: { artefacts_id: @absolute_date_node.artefacts_id, name: @absolute_date_node.name } }
    end

    assert_redirected_to absolute_date_node_url(AbsoluteDateNode.last)
  end

  test "should show absolute_date_node" do
    get absolute_date_node_url(@absolute_date_node)
    assert_response :success
  end

  test "should get edit" do
    get edit_absolute_date_node_url(@absolute_date_node)
    assert_response :success
  end

  test "should update absolute_date_node" do
    patch absolute_date_node_url(@absolute_date_node), params: { absolute_date_node: { artefacts_id: @absolute_date_node.artefacts_id, name: @absolute_date_node.name } }
    assert_redirected_to absolute_date_node_url(@absolute_date_node)
  end

  test "should destroy absolute_date_node" do
    assert_difference('AbsoluteDateNode.count', -1) do
      delete absolute_date_node_url(@absolute_date_node)
    end

    assert_redirected_to absolute_date_nodes_url
  end
end
