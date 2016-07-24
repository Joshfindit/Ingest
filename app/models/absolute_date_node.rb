class AbsoluteDateNode 
  include Neo4j::ActiveNode
  property :name, type: String
  property :normalized_name, type: String

  has_many :in, :artefact, type: :ABSOLUTEDATETIME_OCCURREDAT, model_class: :Artefact


end
