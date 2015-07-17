class Selecta < Sinatra::Base
  post '/logout' do
    set_current_user nil

    redirect '/'
  end
end