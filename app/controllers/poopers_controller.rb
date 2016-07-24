class PoopersController < ApplicationController
  before_action :set_pooper, only: [:show, :edit, :update, :destroy]

  # GET /poopers
  # GET /poopers.json
  def index
    @poopers = Pooper.all
  end

  # GET /poopers/1
  # GET /poopers/1.json
  def show
  end

  # GET /poopers/new
  def new
    @pooper = Pooper.new
  end

  # GET /poopers/1/edit
  def edit
  end

  # POST /poopers
  # POST /poopers.json
  def create
    @pooper = Pooper.new(pooper_params)

    respond_to do |format|
      if @pooper.save
        format.html { redirect_to @pooper, notice: 'Pooper was successfully created.' }
        format.json { render :show, status: :created, location: @pooper }
      else
        format.html { render :new }
        format.json { render json: @pooper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poopers/1
  # PATCH/PUT /poopers/1.json
  def update
    respond_to do |format|
      if @pooper.update(pooper_params)
        format.html { redirect_to @pooper, notice: 'Pooper was successfully updated.' }
        format.json { render :show, status: :ok, location: @pooper }
      else
        format.html { render :edit }
        format.json { render json: @pooper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poopers/1
  # DELETE /poopers/1.json
  def destroy
    @pooper.destroy
    respond_to do |format|
      format.html { redirect_to poopers_url, notice: 'Pooper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pooper
      @pooper = Pooper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pooper_params
      params.require(:pooper).permit(:name, :email, :user_id)
    end
end
