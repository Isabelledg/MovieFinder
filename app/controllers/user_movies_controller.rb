class UserMoviesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.find(params[:user_group_id])
      #get the movies that we select from the form (with the ID) and then store it in the movies array
    @movies = []
    params["movies"].keys.each do |movie_id|
      movie = Movie.find(movie_id)
      @movies << movie
    end
    
    #create a record on the User Movies table based on each movie
    @movies.each do |movie|
      @user_movie = UserMovie.new(user_group: @user_group, movie: movie)
      @user_movie.save
    end
    redirect_to @group


    # if @user_movie.save
    #   redirect_to @group
    # else
    #   render :new
    # end
  end
end
