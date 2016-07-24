class AbsoluteDateNodesController < ApplicationController
  before_action :set_absolute_date_node, only: [:show, :edit, :update, :destroy]

  # GET /absolute_date_nodes
  # GET /absolute_date_nodes.json
  def index
    @absolute_date_nodes = AbsoluteDateNode.all
  end

  # GET /absolute_date_nodes/1
  # GET /absolute_date_nodes/1.json
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
  # POST /absolute_date_nodes.json
  def create
    @absolute_date_node = AbsoluteDateNode.new(absolute_date_node_params)

    respond_to do |format|
      if @absolute_date_node.save
        format.html { redirect_to @absolute_date_node, notice: 'Absolute date node was successfully created.' }
        format.json { render :show, status: :created, location: @absolute_date_node }
      else
        format.html { render :new }
        format.json { render json: @absolute_date_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absolute_date_nodes/1
  # PATCH/PUT /absolute_date_nodes/1.json
  def update
    respond_to do |format|
      if @absolute_date_node.update(absolute_date_node_params)
        format.html { redirect_to @absolute_date_node, notice: 'Absolute date node was successfully updated.' }
        format.json { render :show, status: :ok, location: @absolute_date_node }
      else
        format.html { render :edit }
        format.json { render json: @absolute_date_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absolute_date_nodes/1
  # DELETE /absolute_date_nodes/1.json
  def destroy
    @absolute_date_node.destroy
    respond_to do |format|
      format.html { redirect_to absolute_date_nodes_url, notice: 'Absolute date node was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absolute_date_node
      @absolute_date_node = AbsoluteDateNode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absolute_date_node_params
      params.require(:absolute_date_node).permit(:name, :normalized_name, :artefact_id)
    end
end
