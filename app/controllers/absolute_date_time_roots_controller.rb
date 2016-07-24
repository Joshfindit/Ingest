class AbsoluteDateTimeRootsController < ApplicationController
  before_action :set_absolute_date_time_root, only: [:show, :edit, :update, :destroy]

  # GET /absolute_date_time_roots
  # GET /absolute_date_time_roots.json
  def index
    @absolute_date_time_roots = AbsoluteDateTimeRoot.all
  end

  # GET /absolute_date_time_roots/1
  # GET /absolute_date_time_roots/1.json
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
  # POST /absolute_date_time_roots.json
  def create
    @absolute_date_time_root = AbsoluteDateTimeRoot.new(absolute_date_time_root_params)

    respond_to do |format|
      if @absolute_date_time_root.save
        format.html { redirect_to @absolute_date_time_root, notice: 'Absolute date time root was successfully created.' }
        format.json { render :show, status: :created, location: @absolute_date_time_root }
      else
        format.html { render :new }
        format.json { render json: @absolute_date_time_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absolute_date_time_roots/1
  # PATCH/PUT /absolute_date_time_roots/1.json
  def update
    respond_to do |format|
      if @absolute_date_time_root.update(absolute_date_time_root_params)
        format.html { redirect_to @absolute_date_time_root, notice: 'Absolute date time root was successfully updated.' }
        format.json { render :show, status: :ok, location: @absolute_date_time_root }
      else
        format.html { render :edit }
        format.json { render json: @absolute_date_time_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absolute_date_time_roots/1
  # DELETE /absolute_date_time_roots/1.json
  def destroy
    @absolute_date_time_root.destroy
    respond_to do |format|
      format.html { redirect_to absolute_date_time_roots_url, notice: 'Absolute date time root was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absolute_date_time_root
      @absolute_date_time_root = AbsoluteDateTimeRoot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absolute_date_time_root_params
      params.require(:absolute_date_time_root).permit(:name)
    end
end
