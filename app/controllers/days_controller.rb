class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  # GET /days
  def index
    @days = Day.all
  end

  # GET /days/1
  def show
  end

  # GET /days/new
  def new
    @day = Day.new
  end

  # GET /days/1/edit
  def edit
  end

  # POST /days
  def create
    @day = Day.new(day_params)

    if @day.save
      redirect_to @day, notice: 'Day was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /days/1
  def update
    if @day.update(day_params)
      redirect_to @day, notice: 'Day was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /days/1
  def destroy
    @day.destroy
    redirect_to days_url, notice: 'Day was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day
      @day = Day.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def day_params
                              
      params.require(:day).permit( :name, :day, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
