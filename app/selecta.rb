require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Selecta < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash


  run! if app_file == $0
  
  get '/' do
    @links = Link.all.sort_by { |link| -link.likes.count }

    erb :index
  end

  post '/user' do
    user = User.new(
      username: params[:username],
      email:    params[:email   ])
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome user"
    else
      flash.now[:errors] = user.errors.full_messages
    end

    erb :index
  end

  post '/link' do
    link = Link.new(
      title:   params[:title   ],
      url:     params[:url     ],
      user_id: session[:user_id])
    if link.save
      flash[:notice] = 'Submission successful'
    else
      flash.now[:errors] = user.errors.full_messages
    end

    erb :index
  end

  post '/like' do
    like = Like.new(
      user_id: )

  end

end



