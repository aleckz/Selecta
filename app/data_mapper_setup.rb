env = env['test'] || 'development'


DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'postgres://user:password@hostname/selecta_#{env}')
  
  require './app/models/like'
  require './app/models/link'

DataMapper.finalize
DataMapper.auto_migrate!