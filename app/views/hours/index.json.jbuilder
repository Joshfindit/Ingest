json.array!(@hours) do |hour|
  json.extract! hour, :id, :name, :hour, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url hour_url(hour, format: :json)
end
