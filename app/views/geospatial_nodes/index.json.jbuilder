json.array!(@geospatial_nodes) do |geospatial_node|
  json.extract! geospatial_node, :id, :name, :latitude, :longitude, :geospatialSemanticZoomOut_id, :atCoordinates_id
  json.url geospatial_node_url(geospatial_node, format: :json)
end
