class FiguresController < ApplicationController

# List all figures
  get '/figures' do
  @figures = Figure.all
  erb :"figures/index"
  end

    # view form to create new figure
  get '/figures/new' do
    @figures = Figure.all
    @f = Figure.new
    erb :"figures/new"
  end

## creat new stuff
  post '/figures' do
    @figure = Figure.create(params)

    redirect to '/figures/#{@figure.id}'

  end

  # post '/landmarks' do
  # @landmarks = Landmark.create(params)
  # redirect to '/landmarks/#{@landmarks.id}'
  # end

    # see a specific single figure
  get '/figures/:id' do
    get_figures
    erb :"figures/show"
  end

    # view to edit a single figure
  get '/figures/:id/edit' do
    get_figures
    erb :"figures/edit"
  end

    # updates
  patch '/figures/:id' do
    binding.pry
    @figures = Figure.find(params[:id])
    @figures.update(params[:figure])
    redirect to '/figures/#{@figure.id}'
  end



  def get_figures
    @figures = Figure.find(params[:id])
  end


end
