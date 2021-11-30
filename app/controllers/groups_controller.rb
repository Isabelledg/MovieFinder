class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
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

  def join
    @group = Group.find(params[:id])
    @group.users << current_user
    if @group.save!
      redirect_to @group
    else
      redirect_to @group
    end
  end

  def create
    @group = Group.new(params[:name])
    @group.users << current_user
    if @group.save!
      redirect_to @group
    else
      render :new
    end
  end
end
