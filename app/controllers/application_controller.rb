require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "marchingbandforever"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!session[:member_id] #double negation converts value to binary
    end

    def current_member
        Member.find(session[:member_id])
    end
  end

end
