class GeospatialNodesController < ApplicationController
  before_action :set_geospatial_node, only: [:show, :edit, :update, :destroy]

  # GET /geospatial_nodes
  # GET /geospatial_nodes.json
  def index
    @geospatial_nodes = GeospatialNode.all
  end

  # GET /geospatial_nodes/1
  # GET /geospatial_nodes/1.json
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
  # POST /geospatial_nodes.json
  def create
    @geospatial_node = GeospatialNode.new(geospatial_node_params)

    respond_to do |format|
      if @geospatial_node.save
        format.html { redirect_to @geospatial_node, notice: 'Geospatial node was successfully created.' }
        format.json { render :show, status: :created, location: @geospatial_node }
      else
        format.html { render :new }
        format.json { render json: @geospatial_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geospatial_nodes/1
  # PATCH/PUT /geospatial_nodes/1.json
  def update
    respond_to do |format|
      if @geospatial_node.update(geospatial_node_params)
        format.html { redirect_to @geospatial_node, notice: 'Geospatial node was successfully updated.' }
        format.json { render :show, status: :ok, location: @geospatial_node }
      else
        format.html { render :edit }
        format.json { render json: @geospatial_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geospatial_nodes/1
  # DELETE /geospatial_nodes/1.json
  def destroy
    @geospatial_node.destroy
    respond_to do |format|
      format.html { redirect_to geospatial_nodes_url, notice: 'Geospatial node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geospatial_node
      @geospatial_node = GeospatialNode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geospatial_node_params
      params.require(:geospatial_node).permit(:name, :latitude, :longitude, :geospatialSemanticZoomOut_id, :atCoordinates_id)
    end
end
