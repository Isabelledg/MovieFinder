class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres
end
