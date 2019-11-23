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

  post '/figures' do
      @figure = Figure.create(params["figure"])
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
      redirect to "/figures/#{@figure.id}"
    end

    get '/figures/:id' do
      @figure = Figure.find_by(id: params["id"])
      erb :'figures/show'
    end

    get '/figures' do
      @figures = Figure.all
      erb :'figures/show'
    end

end
