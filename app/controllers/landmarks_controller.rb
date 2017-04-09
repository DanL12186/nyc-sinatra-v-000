class LandmarksController < ApplicationController


  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark]) #just a simple creation, not assigning it to a figure etc.
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params[:landmark][:name] #.update would work too, explicit statements for reference.
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect "landmarks/#{@landmark.id}" #required by spec or it fails..
  end

end
