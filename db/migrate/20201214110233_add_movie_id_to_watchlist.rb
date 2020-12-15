class AddMovieIdToWatchlist < ActiveRecord::Migration[6.0]
  def change
    add_column :watchlists, :movie_id, :integer
  end
end
