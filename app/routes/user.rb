class Selecta < Sinatra::Base

  post '/user' do
    user = User.new params_sender

    if user.save
    set_current_user user.id

      content_type :json
      {userCreated: true}.to_json
    else

      content_type :json
      {userCreated: false}.to_json
    end
  end

  helpers do
    def current_user
      session[:user_id]
    end

    def set_current_user user_id
      session[:user_id] = user_id
    end

    def params_sender
      {
        username:              params[:username             ],
        email:                 params[:email                ],
        password:              params[:password             ],
        password_confirmation: params[:password_confirmation]
      }
    end
  end
end

