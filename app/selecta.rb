require 'sinatra/base'

class Selecta < Sinatra::Base
  get '/' do
    'Hello Selecta!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
