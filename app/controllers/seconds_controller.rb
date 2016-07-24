class SecondsController < ApplicationController
  before_action :set_second, only: [:show, :edit, :update, :destroy]

  # GET /seconds
  # GET /seconds.json
  def index
    @seconds = Second.all
  end

  # GET /seconds/1
  # GET /seconds/1.json
  def show
  end

  # GET /seconds/new
  def new
    @second = Second.new
  end

  # GET /seconds/1/edit
  def edit
  end

  # POST /seconds
  # POST /seconds.json
  def create
    @second = Second.new(second_params)

    respond_to do |format|
      if @second.save
        format.html { redirect_to @second, notice: 'Second was successfully created.' }
        format.json { render :show, status: :created, location: @second }
      else
        format.html { render :new }
        format.json { render json: @second.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seconds/1
  # PATCH/PUT /seconds/1.json
  def update
    respond_to do |format|
      if @second.update(second_params)
        format.html { redirect_to @second, notice: 'Second was successfully updated.' }
        format.json { render :show, status: :ok, location: @second }
      else
        format.html { render :edit }
        format.json { render json: @second.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seconds/1
  # DELETE /seconds/1.json
  def destroy
    @second.destroy
    respond_to do |format|
      format.html { redirect_to seconds_url, notice: 'Second was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second
      @second = Second.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def second_params
      params.require(:second).permit(:name, :normalized_name, :second, :unixtime, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id)
    end
end
