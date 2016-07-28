class AbsoluteDateTimeRootsController < ApplicationController
  before_action :set_absolute_date_time_root, only: [:show, :edit, :update, :destroy]

  # GET /absolute_date_time_roots
  def index
    @absolute_date_time_roots = AbsoluteDateTimeRoot.all
  end

  # GET /absolute_date_time_roots/1
  def show
  end

  # GET /absolute_date_time_roots/new
  def new
    @absolute_date_time_root = AbsoluteDateTimeRoot.new
  end

  # GET /absolute_date_time_roots/1/edit
  def edit
  end

  # POST /absolute_date_time_roots
  def create
    @absolute_date_time_root = AbsoluteDateTimeRoot.new(absolute_date_time_root_params)

    if @absolute_date_time_root.save
      redirect_to @absolute_date_time_root, notice: 'Absolute date time root was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /absolute_date_time_roots/1
  def update
    if @absolute_date_time_root.update(absolute_date_time_root_params)
      redirect_to @absolute_date_time_root, notice: 'Absolute date time root was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /absolute_date_time_roots/1
  def destroy
    @absolute_date_time_root.destroy
    redirect_to absolute_date_time_roots_url, notice: 'Absolute date time root was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absolute_date_time_root
      @absolute_date_time_root = AbsoluteDateTimeRoot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def absolute_date_time_root_params
                              
      params.require(:absolute_date_time_root).permit( :name )
    end
end
