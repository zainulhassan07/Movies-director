class AddTitleToWatchlists < ActiveRecord::Migration[6.0]
  def change
    add_column :watchlists, :title, :string
  end
end
