require 'test_helper'

class AbsoluteDateNodesControllerTest < ActionController::TestCase
  setup do
    @absolute_date_node = absolute_date_nodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absolute_date_nodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create absolute_date_node" do
    assert_difference('AbsoluteDateNode.count') do
      post :create, absolute_date_node: { artefact_id: @absolute_date_node.artefact_id, name: @absolute_date_node.name, normalized_name: @absolute_date_node.normalized_name }
    end

    assert_redirected_to absolute_date_node_path(assigns(:absolute_date_node))
  end

  test "should show absolute_date_node" do
    get :show, id: @absolute_date_node
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @absolute_date_node
    assert_response :success
  end

  test "should update absolute_date_node" do
    patch :update, id: @absolute_date_node, absolute_date_node: { artefact_id: @absolute_date_node.artefact_id, name: @absolute_date_node.name, normalized_name: @absolute_date_node.normalized_name }
    assert_redirected_to absolute_date_node_path(assigns(:absolute_date_node))
  end

  test "should destroy absolute_date_node" do
    assert_difference('AbsoluteDateNode.count', -1) do
      delete :destroy, id: @absolute_date_node
    end

    assert_redirected_to absolute_date_nodes_path
  end
end
