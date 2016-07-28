class AudioRecordingFragment < Artefact
  # include Neo4j::ActiveNode
  # include Neo4jrb::Paperclip
  # property :name, type: String
  property :md5AtSave, type: String

  has_neo4jrb_attached_file :ingestedFile
  validates_attachment_content_type :ingestedFile, content_type: /\Aaudio\/.*\Z/
#  has_neo4jrb_attached_file :ingestedFileMetadata #Part of the artefact class now
#  validates_attachment_content_type :ingestedFileMetadata, content_type: ["/\Atext\/.*\Z/", "application/json"]
#  do_not_validate_attachment_file_type :ingestedFileMetadata
  has_neo4jrb_attached_file :ingestedVisualizationFile
  validates_attachment_content_type :ingestedVisualizationFile, content_type: /\Aimage\/.*\Z/

#  Paperclip.options[:content_type_mappings][:json] = ["application/json", "text/plain"]

  has_one :out, :origionalArtefact, type: :ORIGINAL_AUDIORECORDING, model_class: :AudioRecording
  has_one :out, :previous, type: :AUDIO_RECORDING_SEGMENT_SEMANTIC_SEQUENCE_PREVIOUS, model_class: :AudioRecordingFragment
  has_one :in, :next, type: :AUDIO_RECORDING_SEGMENT_SEMANTIC_SEQUENCE_PREVIOUS, model_class: :AudioRecordingFragment

  def self.ingestParsedAudioRecordingFragmentByJSON(filename)
    # require 'json'
    # Only use for a folder created from a single recording. Support for multiple recordings in one folder requires parsing I don't wanna do right now

    #scrape the JSON index file. We're reading each fragment's JSON
    # Get the full path and filename separately
    puts jsonPathname = Pathname.new(filename)
    puts audioFragmentFolder = jsonPathname.expand_path.dirname


    # parse the JSON
    # jsonFile = File.read(filename)
    # if jsonFileParsed = JSON.parse(jsonFile)
    #   puts jsonFileParsed
    #   jsonFileParsed.each do |jsonFileParsedEntry|
    # puts jsonFileParsedEntry


    #puts jsonFileParsedEntry['file'] ## The name of the audiofile


    # Iterate through the file and grab each filename (which is the audio file)

    # Grab the file named the same, but ending in JSON
    # snippetJsonFile = File.read("#{audioFragmentFolder}/#{audioFragmentFileWithoutExtention}.json")
    snippetJsonFile = File.read(filename)
    # Parse that JSON and ingest
    if audioFragmentJSONFileParsed = JSON.parse(snippetJsonFile)
      # ingestParsedAudioRecordingByJSON(file)

      puts audioFragmentPathname = Pathname.new(audioFragmentJSONFileParsed['snippetFilename'])
      audioFragmentFileWithoutExtention = audioFragmentPathname.basename(".*")
      audioFragmentNode = AudioRecordingFragment.merge(name: audioFragmentJSONFileParsed['snippetFilename'])

      "audioFragmentJSONFileParsed['original']['OriginalLocation'] #{audioFragmentJSONFileParsed['original']['OriginalLocation']}"

      if audioFragmentJSONFileParsed['original']['OriginalLocation']
        if audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'] && audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'] ##Later, change the parsing tool to use capital 'L's
          thisEntryLocationRounded = "#{audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'].to_f.floor2_s(4)}, #{audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'].to_f.floor2_s(4)}"
          puts "thisEntryLocationRounded: #{thisEntryLocationRounded}"
          thisEntryLocation = GeospatialNode.merge(name: thisEntryLocationRounded )

          # thisEntryLocationZoom3Floored = "#{audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'].to_f.floor2_s(3)}, #{audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'].to_f.floor2_s(3)}"
          # thisEntryLocationZoom2Floored = "#{audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'].to_f.floor2_s(2)}, #{audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'].to_f.floor2_s(2)}"
          # thisEntryLocationZoom1Floored = "#{audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'].to_f.floor2_s(1)}, #{audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'].to_f.floor2_s(1)}"
          # thisEntryLocationZoom0Floored = "#{audioFragmentJSONFileParsed['original']['OriginalLocation']['latitude'].to_f.floor2_s(0)}, #{audioFragmentJSONFileParsed['original']['OriginalLocation']['longitude'].to_f.floor2_s(0)}"
          # thisEntryLocationZoom3 = GeospatialNode.merge(name: thisEntryLocationZoom3Floored )
          # thisEntryLocationZoom2 = GeospatialNode.merge(name: thisEntryLocationZoom2Floored )
          # thisEntryLocationZoom1 = GeospatialNode.merge(name: thisEntryLocationZoom1Floored )
          # thisEntryLocationZoom0 = GeospatialNode.merge(name: thisEntryLocationZoom0Floored )
        end
      end

      if thisEntryLocation
        audioFragmentNode.geospatialRecordedAt = thisEntryLocation
        audioFragmentNode.geospatialRecordedAt.createGeospatialTreeFromHere
        # thisEntryLocation.semanticZoomOut = thisEntryLocationZoom3
        # thisEntryLocationZoom3.semanticZoomOut = thisEntryLocationZoom2
        # thisEntryLocationZoom2.semanticZoomOut = thisEntryLocationZoom1
        # thisEntryLocationZoom1.semanticZoomOut = thisEntryLocationZoom0
      end

      if audioFragmentJSONFileParsed['original']['originalFilename']
        if originalAudioFileNode = AudioRecording.merge(name: audioFragmentJSONFileParsed['original']['originalFilename'])
          AudioRecording.ingestUnparsedAudioRecordingByJSON(audioFragmentJSONFileParsed['original']['originalFilename'], "#{audioFragmentFolder}/#{audioFragmentJSONFileParsed['original']['originalFilename']}")
          audioFragmentNode.origionalArtefact = originalAudioFileNode
        end
      end

      if thisEntrySecond = Time.parse(audioFragmentJSONFileParsed['representedDatetime']).strftime("%Y%m%d_%H%M%S")
        thisEntryDatetimeSecond = Second.merge(name: thisEntrySecond)
        audioFragmentNode.datetimeRecordedAt = thisEntryDatetimeSecond
        audioFragmentNode.createAbsoluteDatetimeTreeFromHere
      end


      # if parsedEntry['origional']['originalComputer']
      #   if parsedEntry['Creator']['OS Agent'].include?("iOS")
      #     thisEntryDevice = Device.merge(name: parsedEntry['Creator']['Host Name'])
      #   elsif parsedEntry['Creator']['OS Agent'].include?("MacOS")
      #     thisEntryDevice = Computer.merge(name: parsedEntry['Creator']['Host Name'])
      #   end
      # end

      # puts "audioFragmentJSONFileParsed['original']: #{audioFragmentJSONFileParsed['original']}"

      #if thisEntryDevice = Computer.merge(name: audioFragmentJSONFileParsed['original']['OriginalComputer'])
        # puts "Connecting recording to Device"
        # puts thisEntryDevice.name
      #  audioFragmentNode.deviceRecordedAt = thisEntryDevice
      #end

#      audioFragmentNode.save

      audioFile = File.open("#{audioFragmentFolder}/#{audioFragmentJSONFileParsed['snippetFilename']}")
      audioFragmentNode.ingestedFile = audioFile
      audioFile.close

      # audioFragmentNode.save

      metadataFile = File.open(filename)
      audioFragmentNode.ingestedFileMetadata = metadataFile
      metadataFile.close

      visualizationFile = File.open("#{audioFragmentFolder}/#{audioFragmentFileWithoutExtention}.png")
      audioFragmentNode.ingestedVisualizationFile = visualizationFile
      visualizationFile.close

      audioFragmentNode.save
      audioFragmentNode.errors.full_messages.each do |message|
        # Reports the full errors. In this case, for Paperclip
        puts "Message: #{message}"
      end


      # puts audioFragmentJSONFileParsed
      # puts audioFragmentJSONFileParsed['original']
      # puts audioFragmentJSONFileParsed['original']['OriginalLocation']
      # audioFragmentJSONFileParsed is the metadata for the fragment
      # Example (Note: updated 2016-02-29 @00:49:50 because of the Location being stored in an array in a hash: super annoying. Had to change the snipper:

      # {
      #   "snippetFilename"=>"milo.20160205_080231-0400.mp3",
      #   "md5AtSave"=>"3ed3d488bb66d6546f279e64b7d9d7ec",
      #   "uuid"=>"5c7ee3ab-e1d0-44c4-a158-27ee5fe8fbbf",
      #   "representedDatetime"=>"2016-02-05 08:02:31 -0400",
      #   "representedDatetimeConfidence"=>"Unknown. Cut with FFMPEG. Needs testing to find out how accurate it is.",
      #   "original"=>{
      #     "OriginalFilename"=>"20160205_075709-0400.mp3",
      #     "OriginalComputer"=>"milo",
      #     "OriginalComputerMACAddress"=>"74:d4:35:8f:12:64",
      #     "OriginalLocation"=>{
      #       "latitude"=>"45.828473",
      #       "longitude"=>"-64.20747"
      #     },
      #     "OriginalFilenameConfidence"=>"100%",
      #     "OriginalComputerConfidence"=>"User Specified",
      #     "OriginalLocationConfidence"=>"User Specified",
      #     "OriginalFileRubyTime"=>"2016-02-05 07:57:09 -0400",
      #     "OrigionalDuration"=>1797
      #   }
      # }
      # Copy the file in to the system
    else
      puts "Couldn't read JSON for audio file fragment"
    end
    #   end
    # end

    # Get origional filename
    # Get metadata, including location, computer, and so-on. Need to specify on command-line
    # I have JSON: Forgot about that.

    # Get foder of split files with JSON
    # Get OriginalFilename and ingest
    # Iterate through each, and ingest, linking each to the previous (except for the first )


    ### How to link to previous (one example)
    # def calculate
    # @points = Point.all

    # @points.each_with_index do |point, i|
    #   previous_point = @points[i-1] unless i==0

    #   if previous_point.nil?
    #     # First element, there is no previous and we need to merge a node
    #     puts "i: #{i}. point: #{point}"

    #   elsif previous_point
    #     # second element, there is a previous and we need to merge a node + relationship with the previous
    #     puts "i: #{i}. previous_point: #{previous_point}. point: #{point}"
    #   end
    # end

    # Save associated file (snippetFilename) to paperclip folder (samename.audiofileext instead of samename.json)
    #   {
    ### Property
    #   "snippetFilename": "milo.20160101_002959-0400.flac",

    ### Proeperty
    #   "md5AtSave": "f7908863427d8a09d8319e1d145c9060",

    ### Property: external UUID
    #   "uuid": "f1322017-e20e-466f-97b5-c107ea24dbc1",

    ### Relationship: estimated Datetime
    #   "representedDatetime": "2016-01-01 00:29:59 -0400",
    ### Relationship property
    #   "representedDatetimeConfidence": "Unknown. Cut with FFMPEG. Needs testing to find out how accurate it is.",


    ### Relationship to "Origional" artefact
    #   "original": {

    ### relationship to 'OriginalFilename' node
    #     "OriginalFilename": "2016-01-01@000000.flac",

    ### Relationship from OriginalFilename node to OriginalComputer node
    #     "OriginalComputer": "milo",
    #     "OriginalComputerMACAddress": "74:d4:35:8f:12:64",

    ### Relationship from OriginalFilename to location
    #     "OriginalLocation": [
    #       {
    #         "latitude": "45.828473",
    #         "longitude": "-64.20747"
    #       }
    #     ],

    #     "OriginalFilenameConfidence": "100%",

    ### Property to Computer relationship
    #     "OriginalComputerConfidence": "User Specified",

    ### Property on the Location relationship
    #     "OriginalLocationConfidence": "User Specified",

    ### What is this?
    #     "OriginalFileRubyTime": "2016-01-01 00:00:00 -0400"
    #   }
    # }


    # {
    #   "snippetFilename": "milo.20160101_000000-0400.wav",
    #   "md5AtSave": "f9358affbacd0dfa146a80fdc6c914ea",
    #   "uuid": "d64a34f4-5ac8-4d40-81ce-7ab1db1c2408",
    #   "representedDatetime": "2016-01-01 00:00:00 -0400",
    #   "representedDatetimeConfidence": "Unknown. Cut with FFMPEG. Needs testing to find out how accurate it is.",
    #   "original": {
    #     "OriginalFilename": "2016-01-01@000000.wav",
    #     "OriginalComputer": "milo",
    #     "OriginalComputerMACAddress": "74:d4:35:8f:12:64",
    #     "OriginalLocation": [
    #       {
    #         "latitude": "45.828473",
    #         "longitude": "-64.20747"
    #       }
    #     ],
    #     "OriginalFilenameConfidence": "100%",
    #     "OriginalComputerConfidence": "User Specified",
    #     "OriginalLocationConfidence": "User Specified",
    #     "OriginalFileRubyTime": "2016-01-01 00:00:00 -0400"
    #   }
    # }

  end

  def self.ingestParsedFolderOfAudioRecordingFragments(folder)
    beginning_time = Time.now #Used to calculate how long it takes to process
    rbfiles = File.join(folder, "*.json")
    Dir.glob(rbfiles) {|file|
      ingestParsedAudioRecordingFragmentByJSON(file)
      puts file
    }

    end_time = Time.now #Used to calculate how long it takes to process
    puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds" #Used to calculate how long it takes to process
  end
end
