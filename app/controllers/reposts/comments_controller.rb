class Reposts::CommentsController < CommentsController
  before_action :set_commentable, only: [:create]

  private
  def set_commentable
    @commentable = Repost.find(params[:repost_id])
  end
end