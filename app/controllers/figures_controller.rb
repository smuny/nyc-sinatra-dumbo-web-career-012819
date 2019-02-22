class FiguresController < ApplicationController

  # List all figures
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  # view form to create new figure
  get '/figures/new' do
    @figures = Figure.all
    erb :"figures/new"
  end

  ## creat new stuff
  post '/figures' do
    @figure = Figure.create(params['figure'])

    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end



    @figure.save
    redirect to "/figures/#{@figure.id}"

  end

  # post '/landmarks' do
  # @landmarks = Landmark.create(params)
  # redirect to '/landmarks/#{@landmarks.id}'
  # end

  # PASSING #
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

    @figures = Figure.find(params[:id])
    @figures.update(params[:figure])
    redirect to "/figures "
  end

  delete "/figures/:id" do
    Figure.destroy(params[:id])
    redirect to "/figures"
  end




  def get_figures
    @figures = Figure.find(params[:id])
  end


end
