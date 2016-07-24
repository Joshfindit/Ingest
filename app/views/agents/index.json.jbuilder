json.array!(@agents) do |agent|
  json.extract! agent, :id, :username, :name, :description, :alias, :details, :normalized_name
  json.url agent_url(agent, format: :json)
end
