require 'sinatra/base'
require_relative './data_mapper_setup'

class Selecta < Sinatra::Base
  
  get '/' do
    @links = Link.all.sort_by { |link| -link.likes.count }

    erb :index
  end

  run! if app_file == $0
end



