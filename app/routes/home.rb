class Selecta < Sinatra::Base
  get '/' do
    @links        = retrieve_links_by_number_of_likes
    @current_user = User.get current_user

    erb :index
  end

  def retrieve_links_by_number_of_likes
    Link.retrieve_by_number_of_likes
  end
end