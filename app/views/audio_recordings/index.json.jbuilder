json.array!(@audio_recordings) do |audio_recording|
  json.extract! audio_recording, :id, :name, :md5AtSave, :waveformArray, :durationInSeconds, :origionalArtefactFragments_id
  json.url audio_recording_url(audio_recording, format: :json)
end
