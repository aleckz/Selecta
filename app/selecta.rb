require 'sinatra/base'
require_relative './data_mapper_setup'

class Selecta < Sinatra::Base
  
  get '/' do
    @Link.all(:order => [created_at.desc])

    erb :index
  end

  run! if app_file == $0
end



