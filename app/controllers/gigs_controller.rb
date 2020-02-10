class GigsController < ApplicationController

  # INDEX
  get "/gigs" do
    @gigs=Gigs.all
    erb :"/gigs/index"
  end

  get "/gigs/new" do
    erb :"/gigs/new"
  end

  post "/gigs" do
    @gigs = Gigs.create(
      :gig_name => params[:gig_name],
      :date => params[:date], 
      :location => params[:location], 
      :attending => params[:attending])
    @gigs.save
    redirect "/gigs"
  end

  get "/gigs/:id" do
    @gigs = Gigs.find(params[:id])
    erb :"/gigs/show"
  end

  get "/gigs/:id/edit" do
    @gigs = Gigs.find_by_id(params[:id])
    erb :"/gigs/edit"
  end

  patch "/gigs/:id" do
    updated_gig = Gigs.find_by_id(params[:id])
    updated_gig.update(
      :gig_name => params[:gig_name],
      :date => params[:date], 
      :location => params[:location], 
      :attending => params[:attending]
    )
    redirect "/gigs/#{updated_gig.:id}"
  end

  delete "/gigs/:id/delete" do
    @deletegig = Gigs.find_by_id(params[:id])
    @deletegig.delete
    redirect "/gigs"
  end

end
