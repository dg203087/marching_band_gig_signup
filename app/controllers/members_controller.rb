class MembersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect 'members/id'
    else 
      erb :'/members/new'
    end
  end

  post "/members" do
    if params[:email] == "" || params[:password] == ""
      flash[:message] = "Please enter valid member information."
      redirect to '/signup'
    else
      @member_obj = Member.create(params)
      session[:member_id] = @member_obj.id
      redirect "/members/#{@member_obj.id}"
    end
  end

  get "/login" do
    erb :'members/login'      
  end

  post "/login" do 
    @member_obj = Member.find_by(:email => params[:email]) 
    
    if @member_obj && @member_obj.authenticate(params[:password])
      session[:member_id] = @member_obj.id
      redirect "/members/#{@member_obj.id}" 
    else
      flash[:message] = "Your credentials were invalid. Sign up or try again!"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  get "/members/:id" do
    if logged_in? 
      @member_obj = Member.find(params[:id])
      @gigs = @member_obj.gigs
      erb :'members/show'
    else
      redirect '/login'
      flash[:message] = "Please login."
    end
  end

end
