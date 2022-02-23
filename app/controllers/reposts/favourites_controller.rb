class Reposts::FavouritesController < FavouritesController
  before_action :set_favouriteable, only: [:create]

  private
  def set_favourite
    @favouriteable = Repost.find(params[:repost_id])
  end
end