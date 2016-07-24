json.array!(@decades) do |decade|
  json.extract! decade, :id, :name, :normalized_name, :decade, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id
  json.url decade_url(decade, format: :json)
end
