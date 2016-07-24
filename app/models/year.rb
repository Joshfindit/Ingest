class Year < AbsoluteDateNode
  include Neo4j::ActiveNode
  property :name, type: String
  property :year, type: String

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  has_one :out, :datetimeSemanticZoomOut, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Decade, unique: true
  has_many :in, :datetimeSemanticZoomIn, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Month

end