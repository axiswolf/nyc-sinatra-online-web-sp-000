class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks/new' do

  end

  post '/landmarks' do

  end

  get '/landmarks/all' do
    @landmarks = Landmark.all
    erb :'/landmarks/all'

  end

  get '/landmarks/:id' do
    # find by id
  end

end
