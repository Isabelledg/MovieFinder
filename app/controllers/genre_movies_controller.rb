class GenreMoviesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @genre = Genre.find(@group.genre_id)
    @movies = @genre.movies
    raise
    @user_group = @group.user_groups.where(user_id: current_user.id).first
  end
end
