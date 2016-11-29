require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String

end

ENV['DATABASE_URL'] || 'postgres://localhost/mydb'

# DataMapper::Logger.new($stdout, :debug)
database = ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_" +
          (ENV['RACK_ENV'] || "development")
DataMapper.setup(:default, database)
DataMapper.finalize
DataMapper.auto_upgrade!
