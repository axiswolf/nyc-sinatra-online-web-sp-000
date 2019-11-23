class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do
    @landmarks = Landmark.all

    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params["landmark"])
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'

  end

  get '/landmarks/:id' do
    # find by id
    @landmark = Landmark.find_by(params["id"])
    erb :'/landmarks/show'
  end

end
