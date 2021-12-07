class GroupsController < ApplicationController
  def new
    @group = Group.new
    @genres = Genre.all
  end

  def show
    @group = Group.find(params[:id])
    @user_group = UserGroup.find_by(group: @group, user: current_user)
    if !@user_group.nil?
    @empty_movies = @user_group.movies.empty?
    end
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
    @group.user = current_user
    # auto-join group creator
    UserGroup.create(user: current_user, group: @group, password: group_params[:password])
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def results
    @group = Group.find(params[:id])
    @results = movie_counter(@group)
  end

  private

  def group_params
    params.require(:group).permit(:name, :genre_id, :password, :password_confirmation)
  end

  def movie_counter(group)
    results = {}
    group.user_groups.each do |user_group|
      user_group.movies.each do |movie|
        if results[movie].nil?
          results[movie] = 1
        else
          results[movie] += 1
        end
      end
    end
    results.map { |movie, value| [movie, value.to_f / group.users.length] }
  end
end
