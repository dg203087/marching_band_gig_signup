class GigsController < ApplicationController

  # INDEX
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

    if params[:gigs] != "" #if it's not blank?
      gig = current_member.gigs.build(params)
      gig.save
      redirect "/members/#{current_member.id}"
    else
      redirect "/gigs/new"
    end
  end

  #SHOW ROUTE
  get "/gigs/:id" do
    find_gig
    # @gigs = Gig.find(params[:id])
    if logged_in?
      erb :'gigs/show' #redirects destroy instance variables
    else 
      redirect '/login'
    end
  end

  # PURPOSE: Find gig edit page and render edit form
  get "/gigs/:id/edit" do
    find_gig
    # @gigs = Gig.find(params[:id])
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

  #PURPOSE: post changes to gig
  patch "/gigs/:id" do
    find_gig
    if logged_in? && @gigs.member_id == current_member.id
      @gigs.update( #have to be more specific with update, patch creates extra pairs in hash
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
    #@delete_gig = Gig.find_by_id(params[:id])
    @gigs.destroy #destroy removes "call backs"/related actions / delete less comprehesive
    redirect "/members/#{current_member.id}" #not a job to show us something, it's to complete and action
  end

  private

  def find_gig #instance method to stop doing repeated work
    @gigs = Gig.find(params[:id])
  end

end
