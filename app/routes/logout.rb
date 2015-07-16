class Selecta < Sinatra::Base
  post '/logout' do
    session[:user_id] = nil

    redirect '/'
  end
end