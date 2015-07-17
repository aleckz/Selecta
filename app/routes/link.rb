class Selecta < Sinatra::Base
  post '/link' do
    link = Link.new link_required_properties
    link.save

    redirect '/'
  end

  helpers do
    def link_required_properties
      {
        title:   params[:title],
        url:     params[:url  ],
        user_id: current_user
      }
    end
  end
end