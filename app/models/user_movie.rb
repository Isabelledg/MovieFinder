class UserMovie < ApplicationRecord
  belongs_to :user_group
  belongs_to :movie

  # has_many :movies, through: :user_movies
end
