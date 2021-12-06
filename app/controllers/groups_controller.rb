class GroupsController < ApplicationController
  def new
    @group = Group.new
    @genres = Genre.all
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
    @group.genre_id = group_params[:genre_id]
    # auto-join group creator
    UserGroup.create(user: current_user, group: @group, password: group_params[:password])
    if @group.save
      redirect_to group_genre_movies_path(@group)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :genre_id, :password, :password_confirmation)
  end
end
