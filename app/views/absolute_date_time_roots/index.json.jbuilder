json.array!(@absolute_date_time_roots) do |absolute_date_time_root|
  json.extract! absolute_date_time_root, :id, :name
  json.url absolute_date_time_root_url(absolute_date_time_root, format: :json)
end
