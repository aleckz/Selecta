require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://localhost/selecta_#{env}")

  require './app/models/like'
  require './app/models/link'
  require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!