class MoviesController < ApplicationController

	#GET /movies
	def index
		@movies = Movie.all
	end

	#POST /movies
	def create
		Movie.create(movie_params)
		redirect_to action: "index"
	end

	#GET /movies/new
	def new
		@movie = Movie.new
	end

	#GET /movies/:id/edit
	def edit
		@movie = Movie.find(params[:id])
	end

	#GET /movies/:id
	def show
		@movie = Movie.find(params[:id])
	end

	#PATCH /movies/:id
	def update
		@movie = Movie.find(params[:id])
		@movie.update (movie_params)
		redirect_to action: "show", id: params[:id]
	end

	#DELETE /movies/:id
	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
	end

	private
	def movie_params
      params.require(:movie).permit(:title, :director, :release_year, :rating)
    end

end
