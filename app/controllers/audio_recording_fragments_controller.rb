class AudioRecordingFragmentsController < ApplicationController
  before_action :set_audio_recording_fragment, only: [:show, :edit, :update, :destroy]

  # GET /audio_recording_fragments
  def index
    @audio_recording_fragments = AudioRecordingFragment.all
  end

  # GET /audio_recording_fragments/1
  def show
  end

  # GET /audio_recording_fragments/new
  def new
    @audio_recording_fragment = AudioRecordingFragment.new
  end

  # GET /audio_recording_fragments/1/edit
  def edit
  end

  # POST /audio_recording_fragments
  def create
    @audio_recording_fragment = AudioRecordingFragment.new(audio_recording_fragment_params)

    if @audio_recording_fragment.save
      redirect_to @audio_recording_fragment, notice: 'Audio recording fragment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /audio_recording_fragments/1
  def update
    if @audio_recording_fragment.update(audio_recording_fragment_params)
      redirect_to @audio_recording_fragment, notice: 'Audio recording fragment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /audio_recording_fragments/1
  def destroy
    @audio_recording_fragment.destroy
    redirect_to audio_recording_fragments_url, notice: 'Audio recording fragment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording_fragment
      @audio_recording_fragment = AudioRecordingFragment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def audio_recording_fragment_params
                              
      params.require(:audio_recording_fragment).permit( :name, :origionalArtefact => [], :previous => [] )
    end
end
