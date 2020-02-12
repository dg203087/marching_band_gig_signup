class MembersController < ApplicationController

  get "/signup" do
    # if logged_in?
    #   redirect 'members/id'
    # else 
      erb :'/members/new'
    # end
  end

  post "/signup" do
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @member_obj = Member.create(:email => params[:email], 
      :password => params[:password], :instrument => params[:instrument], 
      :full_name => params[:full_name])
      session[:member_id] = @member_obj.id
      redirect "/members/#{@member_obj.id}"
    end
  end

  #PURPOSE: render login page/form
  get "/login" do
    # @error_message = params[:error]
    # if logged_in?
    #   redirect 'members/:id'
    # else
        erb :'members/login'      
    # end
  end

  #PURPOSE: receive login form, find user, and log in i.e. create a session (adding key/value pair to session hash)
  post "/login" do 
    @member_obj = Member.find_by(:email => params[:email]) #find_by takes key/value pair
    
    if @member_obj && @member_obj.authenticate(params[:password])
      session[:member_id] = @member_obj.id
      redirect "/members/#{@member_obj.id}"
    else
      
      redirect to '/login'
    end


  end

  get '/logout' do #should be a delete?
    session.clear
    redirect to '/'
  end

  #SHOW ROUTE
  get "/members/:id" do
    @member_obj = Member.find(params[:id])
    @gigs = @member_obj.gigs
    erb :'members/show'
  end

end
