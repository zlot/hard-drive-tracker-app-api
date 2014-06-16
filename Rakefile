require 'dm-migrations'

desc "List all routes for this application"
task :routes do
  puts `grep '^[get|post|put|delete|].*do$' routes/*.rb | sed 's/do$//'`
end


task :requiremain do
  require'./main.rb'
end

desc "auto migrates the database"
task :migrate => [:requiremain] do
  DataMapper.auto_migrate!
end

desc "auto upgrades the database"
task :upgrade => [:requiremain] do
  DataMapper.auto_upgrade!
end

desc "migrate database & create a test harddrive and event"
task :migrate_createentries => [:migrate] do
  harddrive = Harddrive.create(
    :name => "010",
    :size => "1TB",
    :note => "This is a note for hard drive 010",
    :current_eventid => 1
  )
  harddrive2 = Harddrive.create(
    :name => "020",
    :size => "2TB",
    :note => "This is a note for hard drive 2",
    :current_eventid => 2
  )
  event = Event.new(
    :location => "4th Wall",
    :date     => Time.now,
    :note     => "This is a note for the event",
    :returned_date => Time.now
  )
  event.harddrive = harddrive
  event.save
  event2 = Event.new(
    :location => "2nd Event",
    :date     => Time.now,
    :note     => "This is a note for event2",
    :returned_date => Time.now
  )
  event2.harddrive = harddrive2
  event2.save  
end
