class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  has_many :user_movies
  has_many :user_groups, through: :user_movies
end
