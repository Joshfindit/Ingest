class Quarter < AbsoluteDateNode
  include Neo4j::ActiveNode
  property :name, type: String
  property :quarter, type: Integer
  # 1, 2, 3, 4 = Q1, Q2, Q3, Q4

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_one :out, :datetimeSemanticZoomOut, type: :DATETIME_SEMANTIC_ZOOM_OUT, model_class: :Year, unique: true
  has_many :in, :datetimeSemanticZoomIn, type: :DATETIME_SEMANTIC_ZOOM_IN, model_class: :Month

end
