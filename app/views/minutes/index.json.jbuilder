json.array!(@minutes) do |minute|
  json.extract! minute, :id, :name, :normalized_name, :minute, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url minute_url(minute, format: :json)
end
