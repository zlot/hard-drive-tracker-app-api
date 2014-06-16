REST API for Hard Drive Tracking App for The Monkey's Cobbler
=============================================================

REST API specifically tailored for the Hard Drive Tracking App, for The Monkey's Cobbler.

Uses DataMapper to talk to a sqlite database for persistent storage.

This is not suitable for putting on the internet (due to Access-Control-Allow-Origin header set to *). 
Nor should it be: this is designed to run within the local network in The Monkey's Cobbler studio.

`sqlite` shell will also have to be installed: [Download link](http://www.sqlite.org/2014/sqlite-shell-osx-x86-3080500.zip)


Installing dependencies
---------------
```
gem install bundler
bundle install
```


Running the API
---------------
If running for the first time, you have to migrate the database:
```
rake migrate
```

This will destroy what is currently stored in the database and re-create the tables. Be careful!

Running `rake migrate_createentries` will migrate the db and fill with hard drive 
entries and dummy event listings.

If you make changes to the DataMapper models, you can run `rake upgrade` to modify the tables 
without deleting any tables, columns, or records. 

To run the API, run the server:
```
ruby main.rb
```

