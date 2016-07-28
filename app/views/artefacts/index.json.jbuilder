json.array!(@artefacts) do |artefact|
  json.extract! artefact, :id, :name, :abstract, :content, :external_uuid, :external_source, :creator_id, :tags_id, :snippets_id, :deviceRecordedAt_id, :absoluteDatetimeOccurredAt_id, :absoluteDatetimeRecordedAt_id, :ingestedAt_id, :referencesAbsoluteDatetimes_id, :refersTo_id, :isReferredToBy_id, :absoluteDatetimeOccurredAt_id, :absoluteDatetimeRecordedAt_id, :geospatialOccurrededAt_id, :geospatialRecordedAt_id, :editedAt_id
  json.url artefact_url(artefact, format: :json)
end
