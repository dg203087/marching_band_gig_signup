class MembersController < ApplicationController

  # INDEX - SHOW ALL MEMBERS?
  # get "/members" do
  #   erb :"/members/index.html"
  # end

  # NEW MEMBER
  get "/signup" do
    
    erb :'/members/new'
  end

  # POST NEW MEMBER
  post "/signup" do
    if params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @member = Member.create(:email => params[:email], 
      :password => params[:password], :full_name => params[:full_name], 
      :instrument => params[:instrument])

      session[:member_id] = @member.id
      redirect '/members/show'
    end
  end

  # LOG IN
  get "/login" do
    erb :"members/login"
  end

  # POST LOG IN
  post "/login" do 
    @member = Member.find_by(email: params[:email], password: params[:password])
    if @member
      session[:member_id] = @member.id
      redirect '/members/show'
    else
      redirect to '/members/login'
    end
  end

  #LOG OUT
  get '/logout' do
    session.clear
    redirect to '/welcome'
  end

end
