class AudioRecordingFragmentsController < ApplicationController
  before_action :set_audio_recording_fragment, only: [:show, :edit, :update, :destroy]

  # GET /audio_recording_fragments
  # GET /audio_recording_fragments.json
  def index
    @audio_recording_fragments = AudioRecordingFragment.all
  end

  # GET /audio_recording_fragments/1
  # GET /audio_recording_fragments/1.json
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
  # POST /audio_recording_fragments.json
  def create
    @audio_recording_fragment = AudioRecordingFragment.new(audio_recording_fragment_params)

    respond_to do |format|
      if @audio_recording_fragment.save
        format.html { redirect_to @audio_recording_fragment, notice: 'Audio recording fragment was successfully created.' }
        format.json { render :show, status: :created, location: @audio_recording_fragment }
      else
        format.html { render :new }
        format.json { render json: @audio_recording_fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audio_recording_fragments/1
  # PATCH/PUT /audio_recording_fragments/1.json
  def update
    respond_to do |format|
      if @audio_recording_fragment.update(audio_recording_fragment_params)
        format.html { redirect_to @audio_recording_fragment, notice: 'Audio recording fragment was successfully updated.' }
        format.json { render :show, status: :ok, location: @audio_recording_fragment }
      else
        format.html { render :edit }
        format.json { render json: @audio_recording_fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_recording_fragments/1
  # DELETE /audio_recording_fragments/1.json
  def destroy
    @audio_recording_fragment.destroy
    respond_to do |format|
      format.html { redirect_to audio_recording_fragments_url, notice: 'Audio recording fragment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_recording_fragment
      @audio_recording_fragment = AudioRecordingFragment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_recording_fragment_params
      params.require(:audio_recording_fragment).permit(:name, :origionalArtefact_id, :previous_id)
    end
end
