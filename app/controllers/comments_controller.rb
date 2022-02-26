class CommentsController < ApplicationController
  before_action :set_post_to_vote_on,
                only: %i[vote_like vote_smile vote_thumbs_up]
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render :new, status: :created
    else
      render json: {
               message: @comment.errors.full_messages,
             },
             status: :bad_request
    end
  end

  def update
    # return error('bad_request') unless current_user?(@comment.user)
    @comment = Comment.find(params[:id]).update(comment_params)
    if @comment
      render json: { message: 'Comment updated', status: :ok }
    else
      render json: { message: @post.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    return error('unauthorized') unless deletable?(comment)
    comment.destroy
  end

  # LIKE, THUMBS UP , SMILE SECTION
  def vote_like
    Vote.new(voter: current_user, object: @post).toggle_like
  end

  def vote_smile
    Vote.new(voter: current_user, object: @post).toggle_like
  end

  def vote_thumbs_up
    Vote.new(voter: current_user, object: @post).toggle_like
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def deletable?(comment)
    current_user?(comment.user) || current_user?(comment.commentable.user)
  end

  def set_post_to_vote_on
    @post = Comment.find(params[:id])
  end
end
