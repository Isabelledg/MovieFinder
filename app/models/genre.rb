class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres

  has_many :groups
end
