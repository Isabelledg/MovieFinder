class GenreMoviesController < ApplicationController
  def index
    @genre = Genre.find(params[:user_genre_id])
    @movies = @genre.movies
    @group = Group.find(params[:group_id])
    @user_group = @group.user_groups.where(user_id: current_user.id).first
  end
end
