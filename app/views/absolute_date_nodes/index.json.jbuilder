json.array!(@absolute_date_nodes) do |absolute_date_node|
  json.extract! absolute_date_node, :id, :name, :normalized_name, :artefacts_id
  json.url absolute_date_node_url(absolute_date_node, format: :json)
end
