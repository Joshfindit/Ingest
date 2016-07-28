class ArtefactsController < ApplicationController
  before_action :set_artefact, only: [:show, :edit, :update, :destroy]
  Rails.logger.level = 0

  # GET /artefacts
  def index
    @artefacts = Artefact.all
  end

  # GET /artefacts/1
  def show
  end

  # GET /artefacts/new
  def new
    @artefact = Artefact.new
  end

  # GET /artefacts/1/edit
  def edit
  end

  # POST /artefacts
  def create
    @artefact = Artefact.new(artefact_params)

    if @artefact.save
      redirect_to @artefact, notice: 'Artefact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artefacts/1
  def update
    if @artefact.update(artefact_params)
      redirect_to @artefact, notice: 'Artefact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artefacts/1
  def destroy
    @artefact.destroy
    redirect_to artefacts_url, notice: 'Artefact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefact
      @artefact = Artefact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artefact_params
                              
      #params.require(:artefact).permit( :name, :abstract, :content, :external_uuid, :external_source, :creator => [], :tags => [], :snippets => [], :deviceRecordedAt => [], :absoluteDatetimeOccurredAt => [], :absoluteDatetimeRecordedAt => [], :ingestedAt => [], :referencesAbsoluteDatetimes => [], :refersTo => [], :isReferredToBy => [], :absoluteDatetimeOccurredAt => [], :absoluteDatetimeRecordedAt => [], :geospatialOccurrededAt => [], :geospatialRecordedAt => [], :editedAt => [] )
      params.require(:artefact).permit( :name, :abstract, :content, :external_uuid, :external_source, :creator => [], :tags => [], :snippets => [], :deviceRecordedAt => [], :absoluteDatetimeOccurredAt => [], :absoluteDatetimeRecordedAt => [], :ingestedAt => [], :referencesAbsoluteDatetimes => [], :absoluteDatetimeOccurredAt => [], :absoluteDatetimeRecordedAt => [], :geospatialOccurrededAt => [], :geospatialRecordedAt => [], :editedAt => [] )
    end
end
