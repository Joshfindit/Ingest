json.array!(@years) do |year|
  json.extract! year, :id, :name, :year, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url year_url(year, format: :json)
end
