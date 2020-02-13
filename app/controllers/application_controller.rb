require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "marchingbandforever"
    #extra layer of security
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
      !!current_member #double negation converts value to binary
    end

    def current_member
        @current_member ||= Member.find_by(id: session[:member_id]) 
        #find returns an error if it doesn't find what it's looking for
        #find_by returns nil instead of error
        #energy saver or ||= (or equals) to query the database less
    end

    def authorized_to_edit?(gig)
      gig.member_id == current_member.id
    end

    def bool_to_string(bool)
      bool ? "Yes" : "No"
    end

  end

end
