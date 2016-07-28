class Agent 
  include Neo4j::ActiveNode
  property :name, type: String
  property :description, type: String
  property :alias, type: String
  property :details, type: String

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name
  
  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_many :in, :artefacts, type: :CREATOR, model_class: :Artefact


end
