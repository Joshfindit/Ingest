class AbsoluteDateNode 
  include Neo4j::ActiveNode
  property :name, type: String

  property :normalized_name, type: String
  validates_presence_of :name
  validate :set_normalized_name

  
  private
  def set_normalized_name
    self.normalized_name = self.name.downcase if self.name
  end

  public
  has_many :in, :artefacts, type: :ABSOLUTEDATETIME_RECORDED_AT, model_class: :Artefact


  def createAbsoluteDatetimeTreeFromHere
    #puts absoluteDateNode
    #puts absoluteDateNode.class #gives us ms, s, min, hour, etc

    currentNodeName = self.name
    # puts "self.name: #{self.name}, length: #{self.name.length}"
    for i in (self.name.length).downto(4)
      # puts "Value of local variable in the loop is #{i}"

      if i == 18
        # puts "i: #{i} (18)"
        #This is a millisecond
        thisMillisecond = Millisecond.merge(name: currentNodeName)
        # puts thisMillisecond.name

        thisSecond = Second.merge(name: thisMillisecond.name[0..thisMillisecond.name.length-5])

        thisMillisecond.datetimeSemanticZoomOut = thisSecond

        #chop to second
        currentNodeName = thisSecond.name
        # puts "thisSecond.name: #{thisSecond.name}"
      elsif i == 15
        # puts "i: #{i} (15)"
        # puts "#this is second"
        # puts "Second currentNodeName: #{currentNodeName}"
        thisSecond = Second.merge(name: currentNodeName)
        # puts "thisSecond.name: #{thisSecond.name}"
        # puts thisSecond
        thisMinute = Minute.merge(name: thisSecond.name[0..thisSecond.name.length-3])
        # puts "thisMinute.name: #{thisMinute.name}"
        thisSecond.datetimeSemanticZoomOut = thisMinute
        #chop to minute
        currentNodeName = thisMinute.name
      elsif i == 13
        # puts "i: #{i} (13)"
        # puts "#this is minute"
        # puts currentNodeName

        thisMinute = Minute.merge(name: currentNodeName)
        # puts thisMinute

        thisHour = Hour.merge(name: thisMinute.name[0..thisMinute.name.length-3])

        thisMinute.datetimeSemanticZoomOut = thisHour
        #chop to hour
        currentNodeName = thisHour.name
      elsif i == 11
        # puts "i: #{i} (11)"
        # puts "#this is an hour"
        # puts currentNodeName

        thisHour = Hour.merge(name: currentNodeName)
        thisDay = Day.merge(name: thisHour.name[0..thisHour.name.length-4])

        thisHour.datetimeSemanticZoomOut = thisDay
        #chop to day
        puts currentNodeName = thisDay.name
      elsif i == 8
        # puts "i: #{i} (8)"
        # puts "#this is a day"
        # puts currentNodeName

        thisDay = Day.merge(name: currentNodeName)
        # puts "thisDay #{thisDay}"
        thisMonth = Month.merge(name: (thisDay.name[0..thisDay.name.length-3]))
        # puts "thisMonth #{thisMonth}"
        # puts "Before connecting day to month"
        thisDay.datetimeSemanticZoomOut = thisMonth
        # puts "After connecting day to month"
        #chop to month
        currentNodeName = thisMonth.name
      elsif i == 6
        # puts "i: #{i} (6)"
        # puts" #this is a Month"
        # puts currentNodeName

        thisMonth = Month.merge(name: currentNodeName)
         # puts thisMonth
         # puts thisMonth.name[0..thisMonth.name.length-3].to_i.floor2(1).to_s
        thisYear = Year.merge(name: (thisMonth.name[0..thisMonth.name.length-3]))
         # puts "thisYear: #{thisYear}"

        thisMonth.datetimeSemanticZoomOut = thisYear
        #chop to decade
        currentNodeName = thisYear.name
      elsif i == 4
        # puts "i: #{i} (4)"
        # puts "#Go from year to root"
        # puts currentNodeName
        # puts "Hit 4: #{currentNodeName}"

        thisYear = Year.merge(name: currentNodeName)
        thisDecade = Decade.merge(name: "#{currentNodeName.to_i.floor2(1).to_s}s")
        thisabsolutedatetimeroot = AbsoluteDateTimeRoot.merge(name: "AbsoluteDateTimeRoot")

        
        # puts "thisYear.name: #{thisYear.name}"
        # puts "thisDecade.name: #{thisDecade.name}"
        # puts "thisCentury.name: #{thisCentury.name}"

        #thisDecade = Decade.merge(name: (thisMonth.name[0..thisMonth.name.length-3].to_i.floor2(1).to_s))
        # This is a decade. connect to decade, century, and root
        # thisDecade = currentNodeName
        # thisMonth =  Month.merge(name: thisDay[0..thisDay.length-3])
        # thisYear = Year.merge(name: thisDay[0..thisDay.length-5])
        # thisDecade = Decade.merge(name: (thisDay[0..thisDay.length-5].to_i.floor2(1).to_s))
        # thisCentury = Century.merge(name: thisDay[0..thisDay.length-5].to_i.floor2(2).to_s) #Dropped century
        # thisabsolutedatetimeroot = AbsoluteDateTimeRoot.merge(name: "AbsoluteDateTimeRoot")


        # absoluteDateNode.datetimeSemanticZoomOut = thisMonth
        # thisMonth.datetimeSemanticZoomOut = thisYear
        # thisYear.datetimeSemanticZoomOut = thisDecade
        thisYear.datetimeSemanticZoomOut = thisDecade
        thisDecade.datetimeSemanticZoomOut = thisabsolutedatetimeroot
        # thisCentury.datetimeSemanticZoomOut = # WE DROPPED CENTURY

        return thisabsolutedatetimeroot.name
      else
        # puts "Not a recognized date." # Actually; this happens when i is an even number

        # if absoluteDateNode.name
        #   workingdate = absoluteDateNode.name
        #   if workingdate[0..workingdate.length-3].length
        #   if 
        # puts "we're in 'else'. i = #{i}"
      end
    end
    

    # Traverse up the tree until you hit century. Merge as you go. Names should be unique like:
    # Century: 1900 # Dropped century
    # Decade: 1920
    # Year: 1921
    # Month: 1921-01
    # Day: 1921-01-05
    # Hour: 1921-01-05_15
    # Minute: 1921-01-05_1533
    # Second: 1921-01-05_153354
    # Millisecond: 1921-01-05_153354.382

    # What is the scope? Easily determined by the length(?) Class(?)
    # Parse out the information we have from the name
    # 


    #if ms
      #create relationship to Second
      # ms.datetimeSemanticZoomOut = Second.findby(name: "")
      #if second
        # create relationship to Minute
        #if minute

  end # End the definition of 
end
