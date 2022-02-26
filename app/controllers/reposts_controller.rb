class RepostsController < ApplicationController
  before_action :set_repost, only: %i[vote_like vote_smile vote_thumbs_up]
  def index
    @reposts =
      Repost.from_people_you_know(current_user).includes(:repostable, :user)
  end

  def create
    @repost = @repostable.reposts.build(repost_params)
    @repost.user_id = current_user.id
    if current_user.already_reposted?(@repost.repostable)
      return error('bad_request')
    end

    if @repost.save
      render :new, status: :created
    else
      render json: {
               message: @repost.errors.full_messages,
             },
             status: :bad_request
    end
  end

  def vote_like
    Vote.new(voter: current_user, object: repost_to_vote_on).toggle_like
  end

  def vote_smile
    Vote.new(voter: current_user, object: repost_to_vote_on).toggle_like
  end

  def vote_thumbs_up
    Vote.new(voter: current_user, object: repost_to_vote_on).toggle_like
  end

  def destroy
    repost = Repost.find_by(repostable_id: params[:id])
    current_user.reposts.find(repost.id).destroy
  end

  private

  def repost_params
    params.require(:repost).permit(:body)
  end

  def set_repost
    repost_to_vote_on = Repost.find(params[:id])
  end
end
