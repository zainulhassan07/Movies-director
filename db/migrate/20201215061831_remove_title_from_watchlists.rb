class RemoveTitleFromWatchlists < ActiveRecord::Migration[6.0]
  def change
    remove_column :watchlists, :title, :string
  end
end
