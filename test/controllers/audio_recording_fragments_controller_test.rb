require 'test_helper'

class AudioRecordingFragmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_recording_fragment = audio_recording_fragments(:one)
  end

  test "should get index" do
    get audio_recording_fragments_url
    assert_response :success
  end

  test "should get new" do
    get new_audio_recording_fragment_url
    assert_response :success
  end

  test "should create audio_recording_fragment" do
    assert_difference('AudioRecordingFragment.count') do
      post audio_recording_fragments_url, params: { audio_recording_fragment: { name: @audio_recording_fragment.name, origionalArtefact_id: @audio_recording_fragment.origionalArtefact_id, previous_id: @audio_recording_fragment.previous_id } }
    end

    assert_redirected_to audio_recording_fragment_path(AudioRecordingFragment.last)
  end

  test "should show audio_recording_fragment" do
    get audio_recording_fragment_url(@audio_recording_fragment)
    assert_response :success
  end

  test "should get edit" do
    get edit_audio_recording_fragment_url(@audio_recording_fragment)
    assert_response :success
  end

  test "should update audio_recording_fragment" do
    patch audio_recording_fragment_url(@audio_recording_fragment), params: { audio_recording_fragment: { name: @audio_recording_fragment.name, origionalArtefact_id: @audio_recording_fragment.origionalArtefact_id, previous_id: @audio_recording_fragment.previous_id } }
    assert_redirected_to audio_recording_fragment_path(@audio_recording_fragment)
  end

  test "should destroy audio_recording_fragment" do
    assert_difference('AudioRecordingFragment.count', -1) do
      delete audio_recording_fragment_url(@audio_recording_fragment)
    end

    assert_redirected_to audio_recording_fragments_path
  end
end
