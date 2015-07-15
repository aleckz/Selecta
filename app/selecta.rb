require 'sinatra/base'
require_relative './data_mapper_setup'

class Selecta < Sinatra::Base
  
  run! if app_file == $0
  
  get '/' do
    @links = Link.all.sort_by { |link| -link.likes.count }

    erb :index
  end

  post '/user' do
    user = User.new(
      username: params[:username],
      email:    params[:email   ])
    if user.save?
      flash[:notice] = "Welcome back"
    else
      flash.now[:errors] = user.errors.full_messages
    end

    erb :index
  end

  post '/' do
  end

end



