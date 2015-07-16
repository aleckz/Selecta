class Selecta < Sinatra::Base
  get '/' do
    @links = Link.all.sort_by { |link| link.likes.count }.reverse
    @current_user = User.get current_user

    erb :index
  end
end