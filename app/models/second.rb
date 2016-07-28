class Second < AbsoluteDateNode
  include Neo4j::ActiveNode
  property :name, type: String
  property :second, type: String
  property :unixtime, type: DateTime


  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_one :out, :datetimeSemanticZoomOut, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Minute, unique: true
  has_many :in, :datetimeSemanticZoomIn, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Millisecond

end
