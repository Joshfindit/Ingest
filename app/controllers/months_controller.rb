class MonthsController < ApplicationController
  before_action :set_month, only: [:show, :edit, :update, :destroy]

  # GET /months
  def index
    @months = Month.all
  end

  # GET /months/1
  def show
  end

  # GET /months/new
  def new
    @month = Month.new
  end

  # GET /months/1/edit
  def edit
  end

  # POST /months
  def create
    @month = Month.new(month_params)

    if @month.save
      redirect_to @month, notice: 'Month was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /months/1
  def update
    if @month.update(month_params)
      redirect_to @month, notice: 'Month was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /months/1
  def destroy
    @month.destroy
    redirect_to months_url, notice: 'Month was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month
      @month = Month.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def month_params
                              
      params.require(:month).permit( :name, :month, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
