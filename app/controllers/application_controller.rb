require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "marchingbandforever"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/members/#{current_member.id}"
    else
      erb :welcome
    end 
  end

  helpers do
    def logged_in?
      !!current_member 
    end

    def current_member
        @current_member ||= Member.find_by(id: session[:member_id]) 
    end

    def authorized_to_edit?(gig)
      gig.member_id == current_member.id
    end

    def bool_to_string(bool)
      bool ? "Yes" : "No"
    end

  end

end
