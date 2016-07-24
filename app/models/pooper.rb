class Pooper 
  include Neo4j::ActiveNode
  property :name, type: String
  property :email, type: String

  has_one :out, :user, type: :IS_A, model_class: :User


end
