class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates :body, presence: true,
                    length: { minimum: 3 }
end
