json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :normalized_name, :tagged_id
  json.url tag_url(tag, format: :json)
end
