json.array!(@months) do |month|
  json.extract! month, :id, :name, :normalized_name, :month, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url month_url(month, format: :json)
end
