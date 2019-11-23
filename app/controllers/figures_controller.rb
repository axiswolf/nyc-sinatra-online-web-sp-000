class FiguresController < ApplicationController
  # add controller methods
  get '/figures/new' do
    @titles = Title.all # need this bad boy for the erb, listing out all
    # of the titles from figures.
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'/figures/new'
        # binding.pry
  end

  # post '/figures' do
  #   # check each name field to see if it is not empty
  #   # if it is empty, shovel name into array
  #   # title_params = params["title"]["name"]
  #   # landmark_params = params["landmark"]
  #   # @figure = Figure.create(params["figure"])
  #   @figure = Figure.find_or_create_by(name: params["figure_name"])
  #   if !params["title"]["name"].empty?
  #     @figure.titles << Title.create(name:params["title"]["name"])
  #   end
  #
  #   if !params["landmark"].empty?
  #     landmark = Landmark.create(landmark_params)
  #     @figure.landmarks << landmark
  #   end
  #   @figure.save
  #   puts params
  #
  #   redirect to "figures/#{@figure.id}"
  #
  # end
  #
  #   get '/figures/:id' do
  #     @figure = Figure.find_by(id: params["id"])
  #     erb :'figures/show'
  #   end

  post '/figures' do

      @figure = Figure.create(params["figure"])
      #figure = Figure.find_or_create_by(name: params["figure_name"])

      title_params = params["title"]["name"]
      landmark_params = params["landmark"]

      if !title_params.empty?
        title = Title.create(params["title"])
        @figure.titles << title
      end

      if !landmark_params.empty?
          landmark = Landmark.create(landmark_params)
          @figure.landmarks << landmark
      end
      @figure.save

      redirect to "/figures/#{@figure.id}" #moves to route GET '/figures/:id'
    end

    get '/figures/:id' do

      @figure = Figure.find_by(id: params["id"])

      erb :'figures/show'
    end

end
