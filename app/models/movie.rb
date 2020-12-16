class Movie < ApplicationRecord
  has_many :watchlists, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates :title, :length, presence: true,
                    length: { minimum: 3 }
end
