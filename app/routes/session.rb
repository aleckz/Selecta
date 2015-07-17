class Selecta < Sinatra::Base
  post '/session' do
    user = User.authenticate params

    if user
      create_session user

      content_type :json
      {userRetrieved: true}.to_json
    else
      
      content_type :json
      {userRetrieved: false}.to_json
    end
  end

  helpers do
    def create_session user
      session[:user_id] = user.id
    end
  end
end