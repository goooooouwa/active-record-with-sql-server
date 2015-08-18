# Introduction
This app demonstrates a way to use ActiveRecord with an exising SQL server database.

# The problem
You have an exising("legacy") SQL server database which you have no control over its schema. How to use it with ActiveRecord?

# Why ActiveRecord?
Greatly simplify db access code, no `find_*_by_*` methods, no dao
module, even no stored procedures! Only business model and a schema that reflects the
db structure, plus [Validations](http://guides.rubyonrails.org/active_record_validations.html), [Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html), [Associations](http://guides.rubyonrails.org/association_basics.html), [Cache support](http://guides.rubyonrails.org/caching_with_rails.html) and very importantly a flexable [Query Interface](http://guides.rubyonrails.org/active_record_querying.html).

# Solution
ActiveRecord WITHOUT Migrations +
[activerecord-sqlserver-adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)

## How to do that?
1. By hand-writing `db/schema.rb` file, we can map existing db schema into
our app which requires little work to maintain when db changes it's schema.
2. With activerecord-sqlserver-adapter, we can take full power of
ActiveRecord with SQL server database.

## What does it look like?
For instance, with a `FacebookPage` model setup like [this](https://github.com/goooooouwa/active-record-with-sql-server/blob/master/app/models/facebook_page.rb), you can do things like
```ruby
# 1. Execute stored procedures
FacebookPage.execute_procedure 'p_FacebookPage_sel', id: 32
# 2. Conditions and Ordering
FacebookPage.where("created_dt <= ?", Time.parse("2015-04-22T08:00:00Z")).order("created_dt desc")   # Find all facebook pages created before 2015-04-22 08:00 and order them by created_at in descending order
# 3. Joining Tables
FacebookPage.joins(:facebook_page_event).where({facebook_page_events: {id: 5}})   # Find all facebook_pages for event id being 5
# and much more
```
completely without ever writing one procedure. Of course except the first one :)

# Tools used
- [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)
- [ActiveRecord SQL Server Adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)

# References
- [Using Rails with a legacy database schema](https://schneide.wordpress.com/2014/03/10/using-rails-with-a-legacy-database-schema/)
- [Rails and Legacy Databases - RailsConf 2009](http://www.slideshare.net/napcs/rails-and-legacy-databases-railsconf-2009)
