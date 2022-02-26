class Reposts::RepostsController < RepostsController
  before_action :set_repostable, only: [:create]

  private

  def set_repostable
    @repostable = Repost.find(params[:repost_id])
  end
end
