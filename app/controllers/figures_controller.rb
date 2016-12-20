class FiguresController < ApplicationController

	get "/figures/new" do
		erb :"figures/new"
	end 

	post "/figures" do 
		@figure = Figure.create(params[:figure])
		@title = Title.create(params[:title])
		@landmark = Landmark.create(params[:landmark])
		@figure.titles << @title
		@figure.landmarks << @landmark
		@figure.save
	end 	

	get "/figures" do 
		@figures = Figure.all
		erb :"figures/figures"
	end 	

	get "/figures/:id" do 
		@figure= Figure.find(params[:id])
		erb :"figures/show"
	end 	

	get "/figures/:id/edit" do 
		@figure= Figure.find(params[:id])
		erb :"figures/edit"
	end 
	
	patch "/figures/:id" do 
		@figure= Figure.find(params[:id])
		@figure.update(name: params[:figure][:name])
		redirect "/figures/#{@figures.id}"
	end 


end

