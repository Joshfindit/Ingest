class SecondsController < ApplicationController
  before_action :set_second, only: [:show, :edit, :update, :destroy]

  # GET /seconds
  def index
    @seconds = Second.all
  end

  # GET /seconds/1
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
  def create
    @second = Second.new(second_params)

    if @second.save
      redirect_to @second, notice: 'Second was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /seconds/1
  def update
    if @second.update(second_params)
      redirect_to @second, notice: 'Second was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /seconds/1
  def destroy
    @second.destroy
    redirect_to seconds_url, notice: 'Second was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second
      @second = Second.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def second_params
                              
      params.require(:second).permit( :name, :second, :unixtime, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
