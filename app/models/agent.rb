class Agent 
  include Neo4j::ActiveNode
  property :username, type: String
  property :name, type: String
  property :description, type: String
  property :alias, type: String
  property :details, type: String
  property :normalized_name, type: String

end
