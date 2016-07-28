class QuartersController < ApplicationController
  before_action :set_quarter, only: [:show, :edit, :update, :destroy]

  # GET /quarters
  def index
    @quarters = Quarter.all
  end

  # GET /quarters/1
  def show
  end

  # GET /quarters/new
  def new
    @quarter = Quarter.new
  end

  # GET /quarters/1/edit
  def edit
  end

  # POST /quarters
  def create
    @quarter = Quarter.new(quarter_params)

    if @quarter.save
      redirect_to @quarter, notice: 'Quarter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quarters/1
  def update
    if @quarter.update(quarter_params)
      redirect_to @quarter, notice: 'Quarter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quarters/1
  def destroy
    @quarter.destroy
    redirect_to quarters_url, notice: 'Quarter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quarter
      @quarter = Quarter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quarter_params
                              
      params.require(:quarter).permit( :name, :quarter, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
