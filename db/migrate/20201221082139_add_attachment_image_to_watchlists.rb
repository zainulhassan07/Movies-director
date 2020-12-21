class AddAttachmentImageToWatchlists < ActiveRecord::Migration[6.0]
  def self.up
    change_table :watchlists do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :watchlists, :image
  end
end
