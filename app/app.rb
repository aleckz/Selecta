require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require 'json'
require_relative './data_mapper_setup'

class Selecta < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'
  set :views, proc {File.join(root, '.', 'views')}

  require_relative 'routes/link'
  require_relative 'routes/session'
  require_relative 'routes/user'
  require_relative 'routes/like'
  require_relative 'routes/logout'
  require_relative 'routes/home'

  run! if app_file == $0

end
