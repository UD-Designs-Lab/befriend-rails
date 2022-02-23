class Comments::RepostsController < RepostsController
  before_action :set_repostable, only: [:create]

  private
  def set_repostable
    @repostable = Comment.find(params[:comment_id])
  end
end