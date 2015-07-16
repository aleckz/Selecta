class Selecta < Sinatra::Base
  post '/session' do
    user = User.authenticate params

    if user
      session[:user_id] = user.id
      content_type :json
      {userRetrieved: true}.to_json
    else
      content_type :json
      {userRetrieved: false}.to_json
    end
  end
end