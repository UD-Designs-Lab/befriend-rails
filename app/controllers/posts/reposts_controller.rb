class Posts::RepostsController < RepostsController
  before_action :set_repostable, only: [:create]

  private
  def set_repostable
    @repostable = Post.find(params[:post_id])
  end
end