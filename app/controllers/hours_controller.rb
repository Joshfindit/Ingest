class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /hours
  def index
    @hours = Hour.all
  end

  # GET /hours/1
  def show
  end

  # GET /hours/new
  def new
    @hour = Hour.new
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours
  def create
    @hour = Hour.new(hour_params)

    if @hour.save
      redirect_to @hour, notice: 'Hour was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hours/1
  def update
    if @hour.update(hour_params)
      redirect_to @hour, notice: 'Hour was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hours/1
  def destroy
    @hour.destroy
    redirect_to hours_url, notice: 'Hour was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hour_params
                              
      params.require(:hour).permit( :name, :hour, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
