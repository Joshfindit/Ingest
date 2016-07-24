json.array!(@artefacts) do |artefact|
  json.extract! artefact, :id, :name, :content, :external_uuid, :datetime_occurred_at_id
  json.url artefact_url(artefact, format: :json)
end
