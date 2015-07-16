require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'
require 'pry'


class Selecta < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'secret'
  register Sinatra::Flash
  set :views, proc {File.join(root, '.', 'views')}
  
  get '/' do
    @links = Link.all.sort_by { |link| -link.likes.count }
    erb :index
  end

  post '/user' do
    user = User.new(
      username: params[:username],
      email:    params[:email   ]
    )
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
      user_id: current_user
    )
    if link.save
      flash[:notice] = 'Submission successful'
    else
      flash.now[:errors] = link.errors.full_messages
    end

    erb :index
  end

  post '/like' do
    like = Like.new(
      user_id: current_user,
      link_id: params[:link_id]
    )
    like.save unless already_liked? params[:link_id]

    erb :index
  end

  def already_liked? link_id_checked
    User.get(session[:user_id]).likes.any? do |like|
      like.link_id == link_id_checked
    end
  end

def current_user 
  @user session[:user_id]
end

  run! if app_file == $0
end


#current user
