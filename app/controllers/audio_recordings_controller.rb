class AudioRecordingsController < ApplicationController
  before_action :set_audio_recording, only: [:show, :edit, :update, :destroy]

  # GET /audio_recordings
  def index
    @audio_recordings = AudioRecording.all
  end

  # GET /audio_recordings/1
  def show
  end

  # GET /audio_recordings/new
  def new
    @audio_recording = AudioRecording.new
  end

  # GET /audio_recordings/1/edit
  def edit
  end

  # POST /audio_recordings
  def create
    @audio_recording = AudioRecording.new(audio_recording_params)

    if @audio_recording.save
      redirect_to @audio_recording, notice: 'Audio recording was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /audio_recordings/1
  def update
    if @audio_recording.update(audio_recording_params)
      redirect_to @audio_recording, notice: 'Audio recording was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /audio_recordings/1
  def destroy
    @audio_recording.destroy
    redirect_to audio_recordings_url, notice: 'Audio recording was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording
      @audio_recording = AudioRecording.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def audio_recording_params
                              
      params.require(:audio_recording).permit( :name, :md5AtSave, :waveformArray, :durationInSeconds, :origionalArtefactFragments => [] )
    end
end
