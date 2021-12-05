class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @user_group = UserGroup.find_by(group: @group)
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.delete(params[:id])
  end

  def create
    @group = Group.new(group_params)
    UserGroup.create!(user: current_user, group: @group, password: group_params[:password])
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :password, :password_confirmation)
  end
end
