
class Selecta < Sinatra::Base
  post '/like' do
    like = Like.new(
      user_id: current_user,
      link_id: params[:link_id]
    )
    like.save unless already_liked? params[:link_id]

    number_of_likes = Link.get(params[:link_id]).likes.count

    content_type :json
    {likes: number_of_likes}.to_json
  end

  def already_liked? link_id_checked
    User.get(session[:user_id]).likes.any? do |like|
      like.link_id == link_id_checked
    end
  end
end