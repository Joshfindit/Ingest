class DecadesController < ApplicationController
  before_action :set_decade, only: [:show, :edit, :update, :destroy]

  # GET /decades
  # GET /decades.json
  def index
    @decades = Decade.all
  end

  # GET /decades/1
  # GET /decades/1.json
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
  # POST /decades.json
  def create
    @decade = Decade.new(decade_params)

    respond_to do |format|
      if @decade.save
        format.html { redirect_to @decade, notice: 'Decade was successfully created.' }
        format.json { render :show, status: :created, location: @decade }
      else
        format.html { render :new }
        format.json { render json: @decade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decades/1
  # PATCH/PUT /decades/1.json
  def update
    respond_to do |format|
      if @decade.update(decade_params)
        format.html { redirect_to @decade, notice: 'Decade was successfully updated.' }
        format.json { render :show, status: :ok, location: @decade }
      else
        format.html { render :edit }
        format.json { render json: @decade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decades/1
  # DELETE /decades/1.json
  def destroy
    @decade.destroy
    respond_to do |format|
      format.html { redirect_to decades_url, notice: 'Decade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decade
      @decade = Decade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decade_params
      params.require(:decade).permit(:name, :normalized_name, :decade, :datetimeSemanticZoomOut_id, :datetimeSemanticZoomIn_id)
    end
end
