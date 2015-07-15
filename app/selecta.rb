require 'sinatra/base'

class Selecta < Sinatra::Base
  
  get '/' do
    'Hello Selecta!'
  end

  run! if app_file == $0
end
