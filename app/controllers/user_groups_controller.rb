class UserGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new(user_group_params)
    @user_group.user = current_user
    @user_group.group = @group
    if @user_group.save
      redirect_to group_path(@group) # fix path to genre_movies
    else
      render :new
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new
    if @group.users.include?(current_user)
      #redirect_to group_user_genres_path(@group)
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @user_movie = UserMovie.find(params[:user_movie])
    # @user_group = UserGroup.find(params[:id])
  end

  private

  def user_group_params
    params.require(:user_group).permit(:password)
  end
end
