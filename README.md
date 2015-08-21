# Introduction
This app demonstrates a way to use ActiveRecord with an exising SQL server database.

# The problem
You have an exising("legacy") SQL server database which you have no control over its schema. How to use it with ActiveRecord?

## Why ActiveRecord?
1. Greatly simplify db access code, no `find_*_by_*` methods, no dao
modules, even no stored procedures! Only business logic, really!
2. Significantly performance improvements( **10 times** faster, see section below [How does it perform?](https://github.com/goooooouwa/active-record-with-sql-server/blob/master/README.md#how-does-it-perform)) 
3. An extremely flexable [Query Interface](http://guides.rubyonrails.org/active_record_querying.html)
4. Plus all the goodnesses like [Cache support](http://guides.rubyonrails.org/caching_with_rails.html), [Validations](http://guides.rubyonrails.org/active_record_validations.html), [Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html), [Associations](http://guides.rubyonrails.org/association_basics.html), for free.

# Solution
ActiveRecord WITHOUT Migrations +
[activerecord-sqlserver-adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter)

## How is that achived?
1. By hand-writing `db/schema.rb` file, we are fully confromed to the existing DB schema, never run a migration. (you can see there's [no `db/migrate`](https://github.com/goooooouwa/active-record-with-sql-server/tree/master/db) folder in this demo app, but a hand-written [`db/schema.rb`](https://github.com/goooooouwa/active-record-with-sql-server/blob/master/db/schema.rb).)
2. With [activerecord-sqlserver-adapter](https://github.com/rails-sqlserver/activerecord-sqlserver-adapter), we can take full power of
ActiveRecord with SQL server database. And the configuration is [negligible](https://github.com/goooooouwa/active-record-with-sql-server/blob/master/config/application.rb#L25).

## How does it look like?
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

## How does it perform?
Query | Description | existing code | ActiveRecord
--- | --- | --- | ---
`FacebookPage.find(44)` | find facebook page 44 | 1.2s | 0.8s
`Event.find(25363).facebook_pages` | get all facebook pages for event 25363 | 1.1s | 0.6s
`Event.where("id < 1000")` | get all events under 1000 | 6.4s for our equivalent `Event.all.select{|e| e.id < 1000 }`| 0.6s
`Event.limit(5).offset(30)` | pagination | Not supported | 0.6s
`Event.includes(:facebook_pages).where.not(FacebookPages:{id: nil})` | get all facebook-page-linked events | Not supported | 4.8s
Conclusion: on simple queries, ActiveRecord performs similar with existing code, but while quering large dataset, ActiveRecord outperforms existing code over **one order of magnitude**, which is 10 times faster. ActiveRecord not only has a `O(n)` performance, it's capable of so many things that's simply not possible with our existing code.

Note: benchmark results might vary based on network connection to DB.

# References
- [Using Rails with a legacy database schema](https://schneide.wordpress.com/2014/03/10/using-rails-with-a-legacy-database-schema/)
- [Rails and Legacy Databases - RailsConf 2009](http://www.slideshare.net/napcs/rails-and-legacy-databases-railsconf-2009)
