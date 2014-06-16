class Harddrive
  include DataMapper::Resource
  
  property :name,             String, :key => true
  property :size,             String
  property :note,             Text
  property :current_eventid,  Integer # used to keep track of which event the harddrive is at. 
  has n, :events   # one-to-many. Notice the PLURALIZATION of the related model's name.
end
