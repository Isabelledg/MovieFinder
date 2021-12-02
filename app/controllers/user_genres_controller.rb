class UserGenresController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @genres = Genre.all
  end

  def create
  end
end
