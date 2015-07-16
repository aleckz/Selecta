class Selecta < Sinatra::Base
  post '/link' do
    link = Link.new(
      title:   params[:title],
      url:     params[:url  ],
      user_id: current_user
    )
    if link.save
      flash[:notice] = 'Submission successful'
    else
      flash.now[:errors] = link.errors.full_messages
    end

    redirect '/'
  end
end