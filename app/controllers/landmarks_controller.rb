class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'

  end

  get '/landmarks/:id' do
    # find by id
    @landmark = Landmark.find_by(id: params["id"])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params["id"])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
      @landmark = Landmark.find_by(id: params["id"])
      @landmark.name = params["landmark"]["name"]
      @landmark.year_completed = params["landmark"]["year_completed"].to_i
      @landmark.save
      redirect to "landmarks/#{@landmark.id}"
  end

end
