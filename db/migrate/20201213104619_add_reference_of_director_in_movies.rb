class AddReferenceOfDirectorInMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :director, index: true, foreign_key: true
  end
end
