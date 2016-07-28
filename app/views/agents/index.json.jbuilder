json.array!(@agents) do |agent|
  json.extract! agent, :id, :name, :description, :alias, :details, :artefacts_id
  json.url agent_url(agent, format: :json)
end
