class Posts::FavouritesController < FavouritesController
  before_action :set_favouriteable, only: [:create]

  private

  def set_favouriteable
    @favouriteable = Post.find(params[:post_id])
  end
end
