json.array!(@quarters) do |quarter|
  json.extract! quarter, :id, :name, :normalized_name, :quarter, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url quarter_url(quarter, format: :json)
end
