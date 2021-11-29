class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @group = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.delete(params[:id])
  end
end
