class MoviesController < ApplicationController
  before_action:find_movie, only: [:add_to_watchlist]

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    if current_user.watchlists.select { |t| t.movie_id == @movie.id }.present?
       @remove = current_user.watchlists.select { |t| t.movie_id == @movie.id }.first.id
    end
  end
  
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Your movie succesfully created"
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end 

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
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
    @watchlist.title = @movie.title
    if @watchlist.save
      redirect_to watchlists_path, notice: 'Movie add to watch list'
    else
      redirect_to @movie, notice: 'Could not added Movie to watch list'
    end
  end


  def watchlists
    @watchlists = current_user.watchlists
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :length, :user_id, :username, :image)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
  
