class Selecta < Sinatra::Base
  post '/link' do
    link = Link.new(link_params params)
    link.save

    redirect '/'
  end

  def link_params params
    {
      title:   params[:title],
      url:     params[:url  ],
      user_id: current_user
    }
  end
end