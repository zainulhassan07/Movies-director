class WatchlistsController < ApplicationController

  def destroy
    @watchlist = Watchlist.find(params[:id]).destroy
    redirect_to watchlists_path	
  end

  private
  def watchlist_params
    params.require(:watchlist).permit(:use_id, :watchlist_id, :movie_id, :title, :username)
  end

end
