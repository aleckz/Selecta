
class Selecta < Sinatra::Base
  post '/like' do
    if link_not_before_liked?
      create_like 
    end

    content_type :json
    {likes: number_of_likes(params)}.to_json
  end

  helpers do 

    def link_not_before_liked?
      !(User.have_already_liked? params[:link_id], session)
    end

    def create_like
      Like.create user_and_link_id
    end

    def number_of_likes
      Link.number_of_likes params
    end

    def user_and_link_id
      {
        user_id: current_user,
        link_id: params[:link_id]
      }
    end
  end
end

