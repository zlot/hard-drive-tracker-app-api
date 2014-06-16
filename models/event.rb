class Event
  include DataMapper::Resource
   
  property :id,            Serial  #auto-increment integer, this is PRIMARY KEY
  property :location,      String
  property :date,          DateTime  # switch to DateTime when I know itll work
  property :note,          Text
  property :returned_date, String
  property :returned_note, Text
  
  belongs_to :harddrive   # defaults to :required => true
end