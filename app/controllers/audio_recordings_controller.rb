class AudioRecordingsController < ApplicationController
  before_action :set_audio_recording, only: [:show, :edit, :update, :destroy]

  # GET /audio_recordings
  # GET /audio_recordings.json
  def index
    @audio_recordings = AudioRecording.all
  end

  # GET /audio_recordings/1
  # GET /audio_recordings/1.json
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
  # POST /audio_recordings.json
  def create
    @audio_recording = AudioRecording.new(audio_recording_params)

    respond_to do |format|
      if @audio_recording.save
        format.html { redirect_to @audio_recording, notice: 'Audio recording was successfully created.' }
        format.json { render :show, status: :created, location: @audio_recording }
      else
        format.html { render :new }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /audio_recordings/1
  # PATCH/PUT /audio_recordings/1.json
  def update
    respond_to do |format|
      if @audio_recording.update(audio_recording_params)
        # Connecting it to it's relationships now
        if audio_recording_params['datetimeRecordedAt'] != ""
          puts "\n\naudio_recording_params['datetimeRecordedAt']: true\n"
          @audio_recording.datetimeRecordedAt = Day.merge(name: audio_recording_params['datetimeRecordedAt'])
          @audio_recording.save
          @audio_recording.datetimeRecordedAt.createAbsoluteDatetimeTreeFromHere
        else
          puts "\n\naudio_recording_params['datetimeRecordedAt']: false\n"
#        @artefact.datetimeRecordedAt = Second.merge(name: artefact_params_toIngest['ingestTime'])
#          @artefact.datetimeRecordedAt = Second.merge(name: timeNow.strftime("%Y%m%d_%H%M%S"))
#          @artefact.datetimeRecordedAt.createAbsoluteDatetimeTreeFromHere
        end

        format.html { redirect_to @audio_recording, notice: 'Audio recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_recording }
      else
        format.html { render :edit }
        format.json { render json: @audio_recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_recordings/1
  # DELETE /audio_recordings/1.json
  def destroy
    @audio_recording.destroy
    respond_to do |format|
      format.html { redirect_to audio_recordings_url, notice: 'Audio recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording
      @audio_recording = AudioRecording.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_recording_params
      params.require(:audio_recording).permit(:name, :md5AtSave, :datetimeRecordedAt, :origionalArtefactFragments)
    end
end
