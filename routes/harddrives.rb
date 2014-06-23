# HTTPVERB  RESOURCE          ACTION
# get       /api/harddrives         get all harddrives
# get       /api/harddrives/:id     get a single harddrive by id
# post      /api/harddrives         create a new harddrive
# put       /api/harddrives/:id     update a specific harddrive by id


get '/' do
  redirect to('/index.html')
end

get '/api/harddrives' do
  return Harddrive.all.to_json
end

get '/api/harddrives/:id' do
  harddrive ||= Harddrive.get(params[:id]) || halt(404)
  return harddrive.to_json
end

