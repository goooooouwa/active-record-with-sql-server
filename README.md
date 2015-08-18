# Introduction
This app demonstrates a way to use ActiveRecord with a legacy database
schema( or with one you have no control over

# The problem
You have an exising("legacy") SQL server database which you have no control over its schema. How to use it with ActiveRecord?

# Why ActiveRecord?
Greatly simplify db access code, no `find_*_by_*` methods, no dao
module, no stored procedures! Only business model and a schema that reflects the
db structure.

# Solution:
ActiveRecord WITHOUT Migrations +
activerecord-sqlserver-adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)

## Notes:
By hand-writing `db/schema.rb` file, we can map existing db schema with
our app with requires little work when db changes it's schema.
With activerecord-sqlserver-adapter, we can take full power of
ActiveRecord with SQL server database.

# Tools:
[ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)
[ActiveRecord SQL Server Adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)

# References:
[Using Rails with a legacy database schema](https://schneide.wordpress.com/2014/03/10/using-rails-with-a-legacy-database-schema/)
[Rails and Legacy Databases - RailsConf 2009](http://www.slideshare.net/napcs/rails-and-legacy-databases-railsconf-2009)
