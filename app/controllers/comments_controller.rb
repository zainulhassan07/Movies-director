class CommentsController < ApplicationController
  before_action:find_movie, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    
    redirect_to movie_path(@movie)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :movie_id)
    end

    def find_movie
      @movie = Movie.find(params[:comment][:movie_id])
    end
end