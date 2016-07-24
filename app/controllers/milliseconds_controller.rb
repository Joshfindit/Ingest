class MillisecondsController < ApplicationController
  before_action :set_millisecond, only: [:show, :edit, :update, :destroy]

  # GET /milliseconds
  # GET /milliseconds.json
  def index
    @milliseconds = Millisecond.all
  end

  # GET /milliseconds/1
  # GET /milliseconds/1.json
  def show
  end

  # GET /milliseconds/new
  def new
    @millisecond = Millisecond.new
  end

  # GET /milliseconds/1/edit
  def edit
  end

  # POST /milliseconds
  # POST /milliseconds.json
  def create
    @millisecond = Millisecond.new(millisecond_params)

    respond_to do |format|
      if @millisecond.save
        format.html { redirect_to @millisecond, notice: 'Millisecond was successfully created.' }
        format.json { render :show, status: :created, location: @millisecond }
      else
        format.html { render :new }
        format.json { render json: @millisecond.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milliseconds/1
  # PATCH/PUT /milliseconds/1.json
  def update
    respond_to do |format|
      if @millisecond.update(millisecond_params)
        format.html { redirect_to @millisecond, notice: 'Millisecond was successfully updated.' }
        format.json { render :show, status: :ok, location: @millisecond }
      else
        format.html { render :edit }
        format.json { render json: @millisecond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milliseconds/1
  # DELETE /milliseconds/1.json
  def destroy
    @millisecond.destroy
    respond_to do |format|
      format.html { redirect_to milliseconds_url, notice: 'Millisecond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_millisecond
      @millisecond = Millisecond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def millisecond_params
      params.require(:millisecond).permit(:name, :normalized_name, :millisecond, :datetimeSemanticZoomOut_id)
    end
end
