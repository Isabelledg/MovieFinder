class UserGenresController < ApplicationController
  def new
    @genres = Genre.all
  end

  def create
  end
end
