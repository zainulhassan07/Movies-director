class CommentsController < ApplicationController
  before_action:find_movie, only: [:create]
  before_action:find_movieid_ondestroy, only: [:destroy]

  

  def create
  
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment succesfully created"
      redirect_to movie_path(@movie)
    else
      flash[:error] = "Comment is not created"
    end  
  end

  

  def destroy
    @comment = Comment.find(params[:id]).destroy
    @comment.destroy
    redirect_to movie_path(@movie)	
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :movie_id, :user_id, :username)
    end

    def find_movie
      @movie = Movie.find(params[:comment][:movie_id])
    end

    def find_movieid_ondestroy
      @movie = Movie.find(params[:movie_id])
    end

end