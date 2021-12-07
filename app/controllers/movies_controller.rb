class MoviesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @genre = Genre.find(@group.genre_id)
    @movies = @genre.movies
    @user_group = UserGroup.where(group: @group, user: current_user).first


    #@user_group = @group.user_groups.where(user_id: current_user.id).first

  end
end
