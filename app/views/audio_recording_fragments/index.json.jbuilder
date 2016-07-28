json.array!(@audio_recording_fragments) do |audio_recording_fragment|
  json.extract! audio_recording_fragment, :id, :name, :origionalArtefact_id, :previous_id
  json.url audio_recording_fragment_url(audio_recording_fragment, format: :json)
end
