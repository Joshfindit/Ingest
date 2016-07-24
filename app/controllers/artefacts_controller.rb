class ArtefactsController < ApplicationController
  before_action :set_artefact, only: [:show, :edit, :update, :destroy]

  # GET /artefacts
  # GET /artefacts.json
  def index
    @artefacts = Artefact.all
  end

  # GET /artefacts/1
  # GET /artefacts/1.json
  def show
  end

  # GET /artefacts/new
  def new
    @artefact = Artefact.new
    puts "\n\n\nNEW ARTEFACT: #{@artefact}"
  end

  # GET /artefacts/1/edit
  def edit
  end

  # POST /artefacts
  # POST /artefacts.json
  def create
    @artefact = Artefact.new(artefact_params)

    respond_to do |format|
      if @artefact.save
        format.html { redirect_to @artefact, notice: 'Artefact was successfully created.' }
        format.json { render :show, status: :created, location: @artefact }
        # Save to the filesystem here? ( Yes; this code is called when creating an Artefact from the web )
        # @artefact.save
        # @artefact.saveIngestedFile #"IngestedFile" is acually a JSON file with the contents of the saved article. Can be used to re-import on a DB wipe. With the metadata and relationship files, the entire graph can be rebuilt
#       puts artefact_params
        artefact_params_toIngest = artefact_params
#       artefact_params_toIngest['external_source'] = "@app_name: #{@app_name}, @app_path: #{@app_path}"
        artefact_params_toIngest['external_source'] = "NotesAppRailsV5Startingfreshagain"
        timeNow = Time.now
#       artefact_params_toIngest['ingestTime'] = timeNow.strftime("%Y%m%d_%H%M%S")
        artefact_params_toIngest['ingestTime'] = timeNow.to_f
        artefact_params_toIngest['ingestTimeTimezone'] = timeNow.strftime("%z")
        artefact_params_toIngest['originalMetaDataDumpRaw'] = {}
        artefact_params_toIngest['originalMetaDataDumpRaw']['remote_ip'] = request.remote_ip
        # 
        puts ingestedTempFile = Tempfile.new(['ingestFromNotesAppSubmit', '.json'])
        begin
          ingestedTempFile.write(JSON.pretty_generate(artefact_params_toIngest.as_json))
          ingestedTempFile.rewind
          @artefact.ingestedFile = ingestedTempFile
          @artefact.save
        ensure
          ingestedTempFile.close
          ingestedTempFile.unlink   # deletes the temp file
        end

        # @artefact.saveMetadata_to_JSON
        # @artefact.saveRelationship_to_JSON
        puts "These are the created artefact params: #{@artefact}"

        # Connecting it to it's relationships now
	if artefact_params_toIngest['datetimeRecordedAt'] != ""
          puts "\n\nartefact_params_toIngest['datetimeRecordedAt']: true\n"
          @artefact.datetimeRecordedAt = Second.merge(name: artefact_params_toIngest['datetimeRecordedAt'])
          @artefact.datetimeRecordedAt.createAbsoluteDatetimeTreeFromHere
        else
          puts "\n\nartefact_params_toIngest['datetimeRecordedAt']: false\n"
#        @artefact.datetimeRecordedAt = Second.merge(name: artefact_params_toIngest['ingestTime'])
          @artefact.datetimeRecordedAt = Second.merge(name: timeNow.strftime("%Y%m%d_%H%M%S"))
          @artefact.datetimeRecordedAt.createAbsoluteDatetimeTreeFromHere
        end       

      else
        format.html { render :new }
        format.json { render json: @artefact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artefacts/1
  # PATCH/PUT /artefacts/1.json
  def update
    respond_to do |format|
      if @artefact.update(artefact_params)
        format.html { redirect_to @artefact, notice: 'Artefact was successfully updated.' }
        format.json { render :show, status: :ok, location: @artefact }
      else
        format.html { render :edit }
        format.json { render json: @artefact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artefacts/1
  # DELETE /artefacts/1.json
  def destroy
    @artefact.destroy
    respond_to do |format|
      format.html { redirect_to artefacts_url, notice: 'Artefact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artefact
      @artefact = Artefact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artefact_params
#      params.require(:artefact).permit( :name, :content, :external_uuid, :external_source, :normalized_name, creator: [], tags: [], :deviceRecordedAt, :occurredAt, ingestedAt: [], datetimeRecordedAt: [], referencesAbsoluteDatetime: [], refersTo: [], isReferredToBy: [], geospatialRecordedAt: [], editedAt: [])
#     params.require(:artefact).permit( :name, :content, :external_uuid, :datetime_occurred_at_id, tags: [] )
     params.require(:artefact).permit( :name, :content, :external_uuid, :external_source, :normalized_name, :deviceRecordedAt, :occurredAt, :datetimeRecordedAt, :ingestedFileTimezone, :creator, :geospatialRecordedAt, tags: [])
    end
end
