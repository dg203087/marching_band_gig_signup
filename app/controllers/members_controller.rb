class MembersController < ApplicationController

  get "/signup" do
    erb :'/members/new'
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

  get "/login" do
    erb :'members/login'
      # if logged_in?
      #   redirect '/members/show'
      # else
      #   erb :"/members/login"
      # end
  end

  post "/login" do 
    @member_obj = Member.find_by(:email => params[:email])
    if @member_obj && @member_obj.authenticate(params[:password])
      session[:member_id] = @member_obj.id
      redirect "/members/#{@member_obj.id}"
    else
      redirect to '/members/login'
    end
  end

  get '/logout' do #should be a delete?
    session.clear
    redirect to '/'
  end

  get "/members/:id" do
    @member_obj = Member.find(params[:id])
    erb :'members/show'
  end

end
