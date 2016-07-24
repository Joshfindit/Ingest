json.array!(@days) do |day|
  json.extract! day, :id, :name, :normalized_name, :day, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url day_url(day, format: :json)
end
