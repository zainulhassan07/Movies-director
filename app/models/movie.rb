class Movie < ApplicationRecord
  belongs_to :director
  accepts_nested_attributes_for :director
end
