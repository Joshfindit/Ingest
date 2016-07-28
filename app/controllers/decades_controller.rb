class DecadesController < ApplicationController
  before_action :set_decade, only: [:show, :edit, :update, :destroy]

  # GET /decades
  def index
    @decades = Decade.all
  end

  # GET /decades/1
  def show
  end

  # GET /decades/new
  def new
    @decade = Decade.new
  end

  # GET /decades/1/edit
  def edit
  end

  # POST /decades
  def create
    @decade = Decade.new(decade_params)

    if @decade.save
      redirect_to @decade, notice: 'Decade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /decades/1
  def update
    if @decade.update(decade_params)
      redirect_to @decade, notice: 'Decade was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /decades/1
  def destroy
    @decade.destroy
    redirect_to decades_url, notice: 'Decade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decade
      @decade = Decade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def decade_params
                              
      params.require(:decade).permit( :name, :decade, :datetimeSemanticZoomOut => [], :datetimeSemanticZoomIn => [] )
    end
end
