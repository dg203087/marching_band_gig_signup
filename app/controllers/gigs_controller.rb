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
    @gigs = Gig.find_by_id(params[:id])
    if logged_in?
      erb :"gigs/show"
    else 
      redirect '/login'
    end
  end

  get "/gigs/:id/edit" do
    binding.pry
    @gigs = Gig.find_by_id(params[:id])
    if logged_in?
      erb :"/gigs/edit"
    else
      redirect '/login'
    end
  end

  patch "/gigs/:id" do
    updated_gig = Gig.find_by_id(params[:id])
    updated_gig.update(
      :gig_name => params[:gig_name],
      :date => params[:date], 
      :location => params[:location], 
      :attending => params[:attending]
    )
    redirect "/gigs/#{updated_gig.id}"
  end

  delete "/gigs/:id/delete" do
    @delete_gig = Gig.find_by_id(params[:id])
    @delete_gig.delete
    redirect "/gigs"
  end

end
