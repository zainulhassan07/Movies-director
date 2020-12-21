class Movie < ApplicationRecord
  has_many :watchlists, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title, :length, presence: true,
                    length: { minimum: 3 }

end
