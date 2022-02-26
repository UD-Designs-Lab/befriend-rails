class Comments::FavouritesController < FavouritesController
  before_action :set_favouriteable, only: [:create]

  private

  def set_favouriteable
    @favouriteable = Comment.find(params[:comment_id])
  end
end
