class Artefact 
  include Neo4j::ActiveNode
  property :name, type: String
  property :content, type: String
  property :external_uuid, type: String

  has_one :out, :datetime_occurred_at, type: :ABSOLUTEDATETIME_OCCURREDAT, model_class: :AbsoluteDateNode


end
