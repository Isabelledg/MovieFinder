class UserMoviesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.find(params[:user_group_id])
    @movie = Movie.find(params[:user_movie][:movie_id])
    @user_movie = UserMovie.new(user_group: @user_group, movie: @movie)
    if @user_movie.save
      redirect_to @group
    else
      render :new
    end
  end
end
