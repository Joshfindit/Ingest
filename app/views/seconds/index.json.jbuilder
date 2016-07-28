json.array!(@seconds) do |second|
  json.extract! second, :id, :name, :second, :unixtime, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url second_url(second, format: :json)
end
