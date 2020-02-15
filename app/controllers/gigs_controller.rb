class GigsController < ApplicationController

  get "/gigs" do
    @gigs = Gig.all
    erb :"/gigs/index"
  end

  get "/gigs/new" do
    erb :"/gigs/new"
  end

  post "/gigs" do 
    if !logged_in?
      redirect "/"
    end
    
    if params[:gigs] != ""
      gig = current_member.gigs.build(params)
      gig.save
      redirect "/members/#{current_member.id}"
    else
      flash[:message] = "Please enter valid gig."
      redirect "/gigs/new"
    end
  end


  get "/gigs/:id" do
    find_gig
    if logged_in?
      erb :'gigs/show' 
    else 
      redirect '/login'
    end
  end

  get "/gigs/:id/edit" do
    find_gig
    if logged_in?
      if @gigs.member == current_member
        erb :"/gigs/edit"
      else
        redirect "/members/#{current_member.id}"
      end
    else  
      redirect '/'
    end
  end

  patch "/gigs/:id" do
    find_gig
    if logged_in? && current_user 
      @gigs.update( 
        :gig_name => params[:gig_name],
        :date => params[:date], 
        :location => params[:location], 
        :attending => params[:attending]
      )
      redirect "/gigs/#{@gigs.id}"
    else
      redirect '/'
    end
  end

  delete "/gigs/:id" do
    find_gig
    if logged_in? && @gigs.member_id == current_member.id
      @gigs.destroy 
      redirect "/members/#{current_member.id}" 
    else
      redirect '/'
    end
  end

  private

  def find_gig 
    @gigs = Gig.find_by(id: params[:id]) 

    if @gigs == nil
      flash[:message] = "There is nothing here."
    end
  end

end
