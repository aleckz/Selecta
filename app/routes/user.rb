class Selecta < Sinatra::Base
  post '/user' do
    user = User.new(
      username:              params[:username             ],
      email:                 params[:email                ],
      password:              params[:password             ],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id

      content_type :json
      {userCreated: true}.to_json
    else
      content_type :json
      {userCreated: false}.to_json
    end
  end

  def current_user
    session[:user_id]
  end
  
end