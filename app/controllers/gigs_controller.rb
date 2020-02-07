class GigsController < ApplicationController

  # INDEX
  get "/gigs" do
    erb :"/gigs/index.html"
  end

  # GET: /gigs/new
  get "/gigs/new" do
    erb :"/gigs/new.html"
  end

  # POST: /gigs
  post "/gigs" do
    redirect "/gigs"
  end

  # GET: /gigs/5
  get "/gigs/:id" do
    erb :"/gigs/show.html"
  end

  # GET: /gigs/5/edit
  get "/gigs/:id/edit" do
    erb :"/gigs/edit.html"
  end

  # PATCH: /gigs/5
  patch "/gigs/:id" do
    redirect "/gigs/:id"
  end

  # DELETE: /gigs/5/delete
  delete "/gigs/:id/delete" do
    redirect "/gigs"
  end

end