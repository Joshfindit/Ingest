require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get agents_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_url
    assert_response :success
  end

  test "should create agent" do
    assert_difference('Agent.count') do
      post agents_url, params: { agent: { alias: @agent.alias, description: @agent.description, details: @agent.details, name: @agent.name, normalized_name: @agent.normalized_name, username: @agent.username } }
    end

    assert_redirected_to agent_path(Agent.last)
  end

  test "should show agent" do
    get agent_url(@agent)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_url(@agent)
    assert_response :success
  end

  test "should update agent" do
    patch agent_url(@agent), params: { agent: { alias: @agent.alias, description: @agent.description, details: @agent.details, name: @agent.name, normalized_name: @agent.normalized_name, username: @agent.username } }
    assert_redirected_to agent_path(@agent)
  end

  test "should destroy agent" do
    assert_difference('Agent.count', -1) do
      delete agent_url(@agent)
    end

    assert_redirected_to agents_path
  end
end
