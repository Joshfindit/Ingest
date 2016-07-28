class MillisecondsController < ApplicationController
  before_action :set_millisecond, only: [:show, :edit, :update, :destroy]

  # GET /milliseconds
  def index
    @milliseconds = Millisecond.all
  end

  # GET /milliseconds/1
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
  def create
    @millisecond = Millisecond.new(millisecond_params)

    if @millisecond.save
      redirect_to @millisecond, notice: 'Millisecond was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /milliseconds/1
  def update
    if @millisecond.update(millisecond_params)
      redirect_to @millisecond, notice: 'Millisecond was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /milliseconds/1
  def destroy
    @millisecond.destroy
    redirect_to milliseconds_url, notice: 'Millisecond was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_millisecond
      @millisecond = Millisecond.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def millisecond_params
                              
      params.require(:millisecond).permit( :name, :millisecond, :datetimeSemanticZoomOut => [] )
    end
end
