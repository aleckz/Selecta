
class Selecta < Sinatra::Base
  post '/like' do
    if not User.have_already_liked? params[:link_id], session
      create_like user_and_link_id(params) 
    end

    content_type :json
    {likes: number_of_likes(params)}.to_json
  end

  def user_and_link_id params
    {
      user_id: current_user,
      link_id: params[:link_id]
    }
  end

  def create_like user_and_link_id
    Like.create user_and_link_id
  end

  def number_of_likes params
    Link.number_of_likes params
  end
end

