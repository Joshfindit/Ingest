json.array!(@milliseconds) do |millisecond|
  json.extract! millisecond, :id, :name, :normalized_name, :millisecond, :datetimeSemanticZoomOut_id
  json.url millisecond_url(millisecond, format: :json)
end
