class UserMoviesController < ApplicationController
  def index
    @genre = Genre.find(params[:user_genre_id])
    @movies = @genre.movies
  end
end
