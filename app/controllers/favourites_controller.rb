class FavouritesController < ApplicationController
  def index
    user = User.find_by(username: params[:user_id])
    @favourites = user.favourites.all
  end

  def create
    return error('bad_request') if current_user.favourited?(@favouriteable)
    @favourite = @favouriteable.favourites.build
    @favourite.user_id = current_user.id
    render :new, status: :created if @favourite.save
  end

  def destroy
    favourite = Favourite.find_by(favouriteable_id: params[:id])
    current_user.favourites.find_by(id: favourite.id).destroy
  end
end
