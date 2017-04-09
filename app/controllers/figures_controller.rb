class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @landmarks = Landmark.all #grab landmark array to iterate over
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    @figure = Figure.create(name: params[:figure][:name])                         #params[:title][:name]
    @figure.titles << Title.find_or_create_by(params[:figure][:title_ids]) if params[:figure][:title_ids] != nil
    else
      @figure.titles << Title.find_or_create_by(params[:title][:name]

    #find and set title by its title_ids attribute
    @figure.landmarks << Landmark.find_or_create_by(params[:figure][:landmark_ids]) unless params[:figure][:landmark_ids] == nil
    @figure.save
  end

end
