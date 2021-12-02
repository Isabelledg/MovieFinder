class UserGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new(user_group_params)
    @user_group.user = current_user
    @user_group.group = @group
    if @user_group.save
      redirect_to group_user_genres_path(@group)
    else
      render :new
    end
  end

  def new
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new
    if @group.users.include?(current_user)
      redirect_to group_user_genres_path(@group)
    else
      render :new
    end
  end

  private

  def user_group_params
    params.require(:user_group).permit(:password)
  end
end
