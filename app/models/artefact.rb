class Artefact 
## Stored on mindmapgraph - v5

  include Neo4j::ActiveNode
  include Neo4jrb::Paperclip

  property :name, type: String
  property :content, type: String
  property :public, default: false # Related to User permissions
  property :external_uuid, type: String
  property :external_source, type: String
  property :ingestedFileTimezone, type: String #May need a different name. This is so that absolutedatetimes have the timezone

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name
#  private # Everything below 'private' becomes private, including all instance and class methods
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  has_neo4jrb_attached_file :ingestedFile
  do_not_validate_attachment_file_type :ingestedFile

  has_neo4jrb_attached_file :ingestedFileMetadata
#  validates_attachment_content_type :ingestedFileMetadata, content_type: ["/\Atext\/.*\Z/", "application/json"]
  do_not_validate_attachment_file_type :ingestedFileMetadata

  has_neo4jrb_attached_file :ingestedFileRelationshipList
#  validates_attachment_content_type :ingestedFileRelationshipList, content_type: ["/\Atext\/.*\Z/", "application/json"]
  do_not_validate_attachment_file_type :ingestedFileRelationshipList

  Paperclip.options[:content_type_mappings][:json] = ["application/json", "text/plain"]
  Paperclip.options[:content_type_mappings][:cql] = "text/plain"
  Paperclip.options[:content_type_mappings][:doentry] = "application/xml"

  has_one :out, :creator, type: :CREATOR, model_class: :Agent



#  has_one :in_or_out_or_both, :deviceRecordedAt, type: :FILL_IN_RELATIONSHIP_TYPE_HERE
#  has_one :in_or_out_or_both, :occurredAt, type: :FILL_IN_RELATIONSHIP_TYPE_HERE
#  has_one :in_or_out_or_both, :ingestedAt, type: :FILL_IN_RELATIONSHIP_TYPE_HERE
#  has_one :in_or_out_or_both, :referencesAbsoluteDatetime, type: :FILL_IN_RELATIONSHIP_TYPE_HERE
#  has_one :in_or_out_or_both, :editedAt, type: :FILL_IN_RELATIONSHIP_TYPE_HERE

  has_many :out, :refersTo, type: :REFERS_TO, model_class: false
  has_many :in, :isReferredToBy, type: :REFERS_TO, model_class: false

  has_many :in, :snippets, type: :SNIPPET_OF, model_class: false

#  has_one :out, :datetime_occurred_at, type: :ABSOLUTEDATETIME_OCCURREDAT, model_class: :AbsoluteDateNode
#  has_one :out, :datetime_occurred_at, type: :DATETIME_ARTEFACT_RECORDED_AT, model_class: :AbsoluteDateNode
#  has_one :out, :datetimeOccurredAt, type: :DATETIME_ARTEFACT_RECORDED_AT, model_class: :AbsoluteDateNode
#  has_one :out, :datetimeRecordedAt, type: :DATETIME_ARTEFACT_RECORDED_AT, model_class: :AbsoluteDateNode
  has_one :out, :absoluteDatetimeOccurredAt, type: :ABSOLUTEDATETIME_OCCURRED_AT, model_class: :AbsoluteDateNode
  has_one :out, :absoluteDatetimeRecordedAt, type: :ABSOLUTEDATETIME_RECORDED_AT, model_class: :AbsoluteDateNode

  has_one :out, :geospatialOcurrededAt, type: :GEOSPATIAL_OCURRED_AT, model_class: :GeospatialNode
  has_one :out, :geospatialRecordedAt, type: :GEOSPATIAL_RECORDED_AT, model_class: :GeospatialNode #Technically for recordings, but Dayone entries are recordings, for example

#  has_many :out, :tags, type: :CONCEPTUAL_TAG, model_class: :Tag, rel_class: :Conceptually_Tagged
  has_many :out, :tags, rel_class: :Conceptually_Tagged

  ## User permissions. With this model, views call this function instead of the list
  def visible_to(user)
    query_as(:artefact)
      .match_nodes(agent: user)
      .where("artefact.public OR artefact<-[:CREATED]-agent OR artefact-[:ACL_VIEWABLE_BY]->agent OR artefact-[:ACL_VIEWABLE_BY]->(:Group)<-[:ACL_HAS_SUBGROUP*0..5]-(:Group)<-[:ACL_BELONGS_TO]-agent")
      .pluck('DISTINCT artefact')
  end

end


class Conceptually_Tagged
  include Neo4j::ActiveRel
#  before_save :do_this

  from_class :Artefact
  to_class   :Tag
  type 'CONCEPTUAL_TAG'

  creates_unique :all #only count it as a unique relationship when all properties match (and therefore don't duplicate it)
#  property :since, type: Integer
#  property :grade, type: Integer
#  property :notes

#  validates_presence_of :since

#  def do_this
    #a callback
#  end
end


class DayOneEntry < Artefact
  require 'digest'

#  has_neo4jrb_attached_file :ingestedFile
#  do_not_validate_attachment_file_type :ingestedFile

  Paperclip.options[:content_type_mappings][:doentry] = "application/xml"

#  has_neo4jrb_attached_file :ingestedFileMetadata
#  validates_attachment_content_type :ingestedFileMetadata, content_type: ["/\Atext\/.*\Z/", "application/json"]
#  do_not_validate_attachment_file_type :ingestedFileMetadata

  def self.ingestDayOneEntry(filename)
    # require "rexml/document"
    # Note: There is no reason to add the "origional" and "current" metadata layer in the other artefact types
    # Change this to be just origional

    file = File.new(filename) # Create file object from filename

    # Check if it parses successfully as an XML file
    if parsedEntry = Plist::parse_xml(file)

      # Report to the user
      puts "Found and parsed #{parsedEntry['UUID']}."
      parsedEntry['Creation Date']

      # The filename is unique since it's a pre-generated UUID, so we can use it as a primary key
      # Merge based on the name
      entryNode = Artefact.merge(name: parsedEntry['UUID'])
      # To get the expected UUID format: 
        # Add dashes in the right place (4 dashes: 8-4-4-4-12)
        # lower-case the string
        # DayOne uses `uuidgen | sed s/-//g`

      # Get the file's metadata
      dayOneFileMetadata = {}
      dayOneFileMetadata['original'] = file.getOSMetaDataObject
      File.open("/tmp/#{File.basename(file)}.json", "w") {|f| f.write(JSON.pretty_generate(dayOneFileMetadata)) } #Automatically closes the file afterwards. The result is the number of bytes written, NOT the File object


      # Creator: Set the creator staticly (Will switch to via metadata later)
      thisEntryCreator = Agent.merge(name: "Joshua Buxton")


      # Geospatial: If the entry has a location, merge it to the location node based on the lat/long
      if parsedEntry['Location']
        if parsedEntry['Location']['Latitude'] && parsedEntry['Location']['Longitude']

          # We're only going to 4 decimal places, which is about 10m
          thisEntryLocationRounded = "#{parsedEntry['Location']['Latitude'].floor2_s(4)}, #{parsedEntry['Location']['Longitude'].floor2_s(4)}"
          # Connect this entry to it's 10m area. Using the format `lat, long` (example: `45.538, -64.249`) as unique identifier
          thisEntryLocation = GeospatialNode.merge(name: thisEntryLocationRounded )
          thisEntryLocation.latitude = parsedEntry['Location']['Latitude'].floor2_s(4)
          thisEntryLocation.longitude = parsedEntry['Location']['Longitude'].floor2_s(4)
          thisEntryLocation.save
          #We're making the Geospatial tree below
        end
      end

      # # DateTime: Connect the entry to the node for the second it was created
      thisEntrySecond = parsedEntry['Creation Date'].strftime("%Y%m%d_%H%M%S")
      thisEntryDatetimeSecond = Second.merge(name: thisEntrySecond)
      # puts thisEntryDatetimeSecond.name

      # # Device it was recorded at: (For example: iPhone, laptop, etc.). Using the host name as unique identifier for now
      # if parsedEntry['Creator'] # In DayOne, `Creator` actually means the device
      #   if parsedEntry['Creator']['OS Agent'].include?("iOS") #Doing different node types depending on if it's mobile or not
      #     thisEntryDevice = Device.merge(name: parsedEntry['Creator']['Host Name'])
      #   elsif parsedEntry['Creator']['OS Agent'].include?("MacOS")
      #     thisEntryDevice = Computer.merge(name: parsedEntry['Creator']['Host Name'])
      #   end
      # end


      # Process the metadata and content of the entry.
      # Up until now, we have created nodes through merge, but not the relationships. Leave the critical processing to the end, so that we can fail small.
      # entryNode.name = parsedEntry['UUID']
      if parsedEntry['Entry Text']
        entryNode.content = parsedEntry['Entry Text']
      end
      #entryNode.uuid = parsedEntry['UUID']
      entryNode.external_uuid = parsedEntry['UUID']
      entryNode.external_source = "DayOne"

     
      entryNode.ingestedFile = file

      metadataFile = File.open("/tmp/#{File.basename(file)}.json")
      entryNode.ingestedFileMetadata = metadataFile
      entryNode.save # Entry node is now created
      metadataFile.close

      # Connect to the creator
      entryNode.creator = thisEntryCreator

      # puts "Connecting DayOne entry to node for the second it was created and the AbsoluteTimeTree"
      entryNode.datetimeRecordedAt = thisEntryDatetimeSecond
      # puts "Adding DayOne's second to Tree"
      # Example: 20151122_022100 > 20151122_0221 > 20151122_02 > 20151122 > 201511 > 2015
      entryNode.datetimeRecordedAt.createAbsoluteDatetimeTreeFromHere

      # puts "Connecting DayOne to the Device it was recorded on"
      #if thisEntryDevice
      #  entryNode.deviceRecordedAt = thisEntryDevice
      #end

      # puts "Connecting the entry to it's location, and the geospatial tree"
      if thisEntryLocation
        # entryNode.geospatialRecordedAt.createGeospatialTreeFromHere
        entryNode.geospatialRecordedAt = thisEntryLocation
#	puts "Creating geospatial Tree"
        entryNode.geospatialRecordedAt.createGeospatialTreeFromHere
      end



      # An entry can have multiple tags. Each Tag is a node with the name as unique identifier. Connect the entry to each tag.
      if parsedEntry["Tags"]
        parsedEntry["Tags"].each do |thisTag|
          thisTagNode = Tag.merge( name: thisTag )
          entryNode.tags << thisTagNode
        end
      end


      # Example Parsed DayOne entry:
        # Creation Date
        # Creator
          # Device Agent
          # Generation Date
          # Host Name
          # OS Agent
          # Software Agent
        # Entry Text
        # Location
          # Latitude
          # Longitude
        # Starred
        # Time Zone
        # UUID

    else
      puts "Failed to parse DayOne Entry"
    end
  end


  def self.ingestDayOneFolderOfEntries(folder)
    beginning_time = Time.now #Used to calculate how long it takes to process

    rbfiles = File.join(folder, "*.doentry")
    Dir.glob(rbfiles) {|file|
      ingestDayOneEntry(file)
      puts file
    }

    end_time = Time.now #Used to calculate how long it takes to process
    puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds" #Used to calculate how long it takes to process
  end

end #End of DayOneEntry class definition
