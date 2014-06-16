# HTTPVERB  RESOURCE          ACTION
# get       /api/events         get all events
# get       /api/events/:id     get a single event by id
# post      /api/events         create a new event
# put       /api/events/:id     update a specific event by id

get '/api/events' do
  return Event.all.to_json
end

get '/api/events/:id' do
  event ||= Event.get(params[:id]) || halt(404)
  return event.to_json
end


post '/api/events' do
  request_body = JSON.parse request.body.read
  event = Event.new(
    :location => request_body['location'],
    :date     => request_body['date'],
    :note     => request_body['note'],
    :returned_date => " ",
    :returned_note => " "
  )
  harddrive = Harddrive.get(request_body['harddrive_name'])
  #puts harddrive
  # set harddrive to event
  event.harddrive = harddrive
  event.save
  
  harddrive.update(
    :current_eventid => event.id 
  )
  status 201
  #return event.to_json
end

options '/api/events' do
  # required as browser will send an OPTIONS request to check if CORS headers are valid
  # see http://stackoverflow.com/questions/13218174/cors-put-not-found-with-jquery-ajax
  return status 200
end

put '/api/events/:id' do
  request_body = JSON.parse request.body.read
  event ||= Event.get(params[:id]) || halt(404)
  halt 500 unless event.update(
    :returned_date => request_body['returned_date'],
    :returned_note => request_body['returned_note']
  )
  # update harddrive
  event.harddrive.update(
    :current_eventid => nil
  )
  puts "eventid: #{event.id}"
end

options '/api/events/:id' do
  # required as browser will send an OPTIONS request to check if CORS headers are valid
  # see http://stackoverflow.com/questions/13218174/cors-put-not-found-with-jquery-ajax
  return status 200
end

