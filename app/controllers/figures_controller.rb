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

  post '/figures' do #(params[:figure][:landmark_ids]) is no good
    #binding.pry
    @figure = Figure.new(params[:figure]) #.create isn't necessary yet, as saving takes place later. No reason to bother the db yet.
    @figure.titles << Title.find_or_create_by(params[:title]) unless params[:title].values == '' #find and set title by its title_ids attribute
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) unless params[:landmark].values == ''
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do      #any hits to /figures/id will read from show.erb
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end


  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])  #grab figure by id from URL
    @landmarks = Landmark.all           #grab all landmarks and titles.
    @titles = Title.all
    erb :'/figures/edit'
  end

  post "/figures/:id" do   #basically the same as new
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name] #string
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark]) unless params[:landmark].values == '' #object
    @figure.titles << Title.find_or_create_by(params[:title]) unless params[:title].values == ''
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
