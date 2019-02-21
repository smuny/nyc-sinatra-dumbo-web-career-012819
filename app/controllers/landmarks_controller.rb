class LandmarksController < ApplicationController

  get '/landmarks' do
  @landmarks = Landmark.all
  erb :landmarks/index
  end

  get '/landmarks/new' do
    @landmarks = Landmark.new
    erb :landmarks/new
  end

  post '/landmarks' do
  @landmarks = Landmark.create(params)
  redirect to '/landmarks/#{@landmarks.id}'
  end

  get '/landmarks/:id' do
    get_landmarks
    erb :show
  end

  get '/landmarks/:id/edit' do
    get_landmarks
    erb :edit
  end

  patch '/landmarks/:id' do
    @landmarks = Landmark.find(params[:id])
    @landmarks.update(params[:landmark])
    redirect to '/landmarks/#{@landmark.id}'
  end

  def get_landmarks
    @landmarks = Landmark.find(params[:id])
  end


end
