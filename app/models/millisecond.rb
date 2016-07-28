class Millisecond < AbsoluteDateNode
  include Neo4j::ActiveNode
  property :name, type: String
  property :millisecond, type: String


  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_one :out, :datetimeSemanticZoomOut, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Second, unique: true

end
