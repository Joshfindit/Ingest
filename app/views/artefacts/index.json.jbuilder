json.array!(@artefacts) do |artefact|
  json.extract! artefact, :id, :name, :content, :external_uuid, :external_source, :normalized_name, :creator_id, :tags_id, :deviceRecordedAt_id, :occurredAt_id, :ingestedAt_id, :datetimeRecordedAt_id, :referencesAbsoluteDatetime_id, :refersTo_id, :isReferredToBy_id, :geospatialRecordedAt_id, :editedAt_id
  json.url artefact_url(artefact, format: :json)
end
