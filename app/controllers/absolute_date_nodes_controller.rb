class AbsoluteDateNodesController < ApplicationController
  before_action :set_absolute_date_node, only: [:show, :edit, :update, :destroy]

  # GET /absolute_date_nodes
  def index
    @absolute_date_nodes = AbsoluteDateNode.all
  end

  # GET /absolute_date_nodes/1
  def show
  end

  # GET /absolute_date_nodes/new
  def new
    @absolute_date_node = AbsoluteDateNode.new
  end

  # GET /absolute_date_nodes/1/edit
  def edit
  end

  # POST /absolute_date_nodes
  def create
    @absolute_date_node = AbsoluteDateNode.new(absolute_date_node_params)

    if @absolute_date_node.save
      redirect_to @absolute_date_node, notice: 'Absolute date node was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /absolute_date_nodes/1
  def update
    if @absolute_date_node.update(absolute_date_node_params)
      redirect_to @absolute_date_node, notice: 'Absolute date node was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /absolute_date_nodes/1
  def destroy
    @absolute_date_node.destroy
    redirect_to absolute_date_nodes_url, notice: 'Absolute date node was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absolute_date_node
      @absolute_date_node = AbsoluteDateNode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def absolute_date_node_params
                              
      params.require(:absolute_date_node).permit( :name, :artefacts => [] )
    end
end
