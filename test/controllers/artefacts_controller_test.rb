require 'test_helper'

class ArtefactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artefact = artefacts(:one)
  end

  test "should get index" do
    get artefacts_url
    assert_response :success
  end

  test "should get new" do
    get new_artefact_url
    assert_response :success
  end

  test "should create artefact" do
    assert_difference('Artefact.count') do
      post artefacts_url, params: { artefact: { absoluteDatetimeOccurredAt_id: @artefact.absoluteDatetimeOccurredAt_id, absoluteDatetimeOccurredAt_id: @artefact.absoluteDatetimeOccurredAt_id, absoluteDatetimeRecordedAt_id: @artefact.absoluteDatetimeRecordedAt_id, absoluteDatetimeRecordedAt_id: @artefact.absoluteDatetimeRecordedAt_id, abstract: @artefact.abstract, content: @artefact.content, creator_id: @artefact.creator_id, deviceRecordedAt_id: @artefact.deviceRecordedAt_id, editedAt_id: @artefact.editedAt_id, external_source: @artefact.external_source, external_uuid: @artefact.external_uuid, geospatialOccurrededAt_id: @artefact.geospatialOccurrededAt_id, geospatialRecordedAt_id: @artefact.geospatialRecordedAt_id, ingestedAt_id: @artefact.ingestedAt_id, isReferredToBy_id: @artefact.isReferredToBy_id, name: @artefact.name, referencesAbsoluteDatetimes_id: @artefact.referencesAbsoluteDatetimes_id, refersTo_id: @artefact.refersTo_id, snippets_id: @artefact.snippets_id, tags_id: @artefact.tags_id } }
    end

    assert_redirected_to artefact_url(Artefact.last)
  end

  test "should show artefact" do
    get artefact_url(@artefact)
    assert_response :success
  end

  test "should get edit" do
    get edit_artefact_url(@artefact)
    assert_response :success
  end

  test "should update artefact" do
    patch artefact_url(@artefact), params: { artefact: { absoluteDatetimeOccurredAt_id: @artefact.absoluteDatetimeOccurredAt_id, absoluteDatetimeOccurredAt_id: @artefact.absoluteDatetimeOccurredAt_id, absoluteDatetimeRecordedAt_id: @artefact.absoluteDatetimeRecordedAt_id, absoluteDatetimeRecordedAt_id: @artefact.absoluteDatetimeRecordedAt_id, abstract: @artefact.abstract, content: @artefact.content, creator_id: @artefact.creator_id, deviceRecordedAt_id: @artefact.deviceRecordedAt_id, editedAt_id: @artefact.editedAt_id, external_source: @artefact.external_source, external_uuid: @artefact.external_uuid, geospatialOccurrededAt_id: @artefact.geospatialOccurrededAt_id, geospatialRecordedAt_id: @artefact.geospatialRecordedAt_id, ingestedAt_id: @artefact.ingestedAt_id, isReferredToBy_id: @artefact.isReferredToBy_id, name: @artefact.name, referencesAbsoluteDatetimes_id: @artefact.referencesAbsoluteDatetimes_id, refersTo_id: @artefact.refersTo_id, snippets_id: @artefact.snippets_id, tags_id: @artefact.tags_id } }
    assert_redirected_to artefact_url(@artefact)
  end

  test "should destroy artefact" do
    assert_difference('Artefact.count', -1) do
      delete artefact_url(@artefact)
    end

    assert_redirected_to artefacts_url
  end
end
