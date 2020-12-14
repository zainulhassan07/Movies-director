class MoviesController < ApplicationController

  def index
    @movies = current_user.movies
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
    @director = @movie.build_director
    @directors = Director.all
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movies_path
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render 'edit'  
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @directors =  Director.all
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :length, :director_id, :user_id )
  end
end
  
