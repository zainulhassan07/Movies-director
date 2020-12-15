class MoviesController < ApplicationController
  before_action:find_movie, only: [:add_to_watchlist]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
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
  end

  def destroy
    @movie = Movie.find(params[:id]).destroy
    redirect_to movies_path
  end

  def add_to_watchlist
    @watchlist = Watchlist.new
    @watchlist.movie_id = @movie.id
    @watchlist.user_id = current_user.id

    if @watchlist.save
      redirect_to @movie, notice: 'Movie Added to watch list'
    else
      redirect_to @movie, notice: 'Couldnot add Movie to watch list'
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :length, :user_id )
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
  
