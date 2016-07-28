class Decade < AbsoluteDateNode
  include Neo4j::ActiveNode
  property :name, type: String
  property :decade, type: String


  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_one :out, :datetimeSemanticZoomOut, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :AbsoluteDateTimeRoot, unique: true
  # Dropped century (See above)
  # has_one :out, :datetime_semantic_zoom_out, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Century, unique: true
  has_many :in, :datetimeSemanticZoomIn, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Year
end
