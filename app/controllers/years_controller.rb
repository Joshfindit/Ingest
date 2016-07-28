class YearsController < ApplicationController
  before_action :set_year, only: [:show, :edit, :update, :destroy]

  # GET /years
  def index
    @years = Year.all
  end

  # GET /years/1
  def show
  end

  # GET /years/new
  def new
    @year = Year.new
  end

  # GET /years/1/edit
  def edit
  end

  # POST /years
  def create
    @year = Year.new(year_params)

    if @year.save
      redirect_to @year, notice: 'Year was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /years/1
  def update
    if @year.update(year_params)
      redirect_to @year, notice: 'Year was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /years/1
  def destroy
    @year.destroy
    redirect_to years_url, notice: 'Year was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def year_params
                              
      params.require(:year).permit( :name, :year, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
