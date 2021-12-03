class UserMoviesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.find(params[:user_group_id])
    @movie = Movie.find(params[:format])
    @user_movie = UserMovie.new(user_group: @user_group, movie: @movie)
    if @user_movie.save
      redirect_to group_user_group_path(@group, @user_group)
    else
      render :new
    end
  end
end
