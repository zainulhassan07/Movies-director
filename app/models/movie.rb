class Movie < ApplicationRecord
  has_many :watchlists
  has_many :comments
end
