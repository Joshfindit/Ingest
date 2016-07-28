class GeospatialNodesController < ApplicationController
  before_action :set_geospatial_node, only: [:show, :edit, :update, :destroy]

  # GET /geospatial_nodes
  def index
    @geospatial_nodes = GeospatialNode.all
  end

  # GET /geospatial_nodes/1
  def show
  end

  # GET /geospatial_nodes/new
  def new
    @geospatial_node = GeospatialNode.new
  end

  # GET /geospatial_nodes/1/edit
  def edit
  end

  # POST /geospatial_nodes
  def create
    @geospatial_node = GeospatialNode.new(geospatial_node_params)

    if @geospatial_node.save
      redirect_to @geospatial_node, notice: 'Geospatial node was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /geospatial_nodes/1
  def update
    if @geospatial_node.update(geospatial_node_params)
      redirect_to @geospatial_node, notice: 'Geospatial node was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /geospatial_nodes/1
  def destroy
    @geospatial_node.destroy
    redirect_to geospatial_nodes_url, notice: 'Geospatial node was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geospatial_node
      @geospatial_node = GeospatialNode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def geospatial_node_params
                              
      params.require(:geospatial_node).permit( :name, :latitude, :longitude, :geospatialSemanticZoomOut => [], :geospatialSemanticZoomIn => [], :geospatialOccurredAt => [], :geospatialRecordedAt => [] )
    end
end
