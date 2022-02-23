class PostsController < ApplicationController
  before_action :set_image, only: %i( update)
  before_action :set_filtered_post, only: %i( vote_like vote_smile vote_thumbs_up)
  before_action :set_post, only: %i( update)
  def index
    @posts = Post.from_people_you_know(current_user).includes(:user)
  end

  def show
    @post = Post.find_by(uuid: params[:id])
  end

  def create
    @image = FileUpload.new(
      file: params[:image],
      file_location: nil,
      action: params[:action]
    ).upload_image!

    @post = current_user.posts.create!(
      body: params[:body],
      image: @image['url'],
      reply_status: params[:reply_status]
    )

    if @post
      render :new, status: :created
    else
      render json: { message: @post.errors.full_messages }, status: :bad_request
    end
  end

  def update 
    return error('bad_request') unless current_user?(@post.user)
    if @post.update(
      body: params[:body],
      image: @image['url'],
      reply_status: params[:reply_status]
    )
      render json: { message: "Post updated", status: :ok }
    else
      render json: { message: @post.errors.full_messages }, status: :bad_request
    end
  end


  def destroy
    post = Post.find(params[:id])
    return error('bad_request') unless current_user?(post.user)

    FileUpload.new(
      file: nil,
      file_location: post.image,
      action: params[:action]
    ).delete_image!

    post.destroy
    render json: { message: 'Deleted post!' }
  end

# LIKE, SMILE, THUMBS UP SECTION 
  def vote_like
    Vote.new(voter: current_user, object: @filtered_post).toggle_like
    # head 204
  end


  def vote_smile
    Vote.new(voter: current_user, object: @filtered_post).toggle_smile
    # head 204
  end

  def vote_thumbs_up
    Vote.new(voter: current_user, object: @filtered_post).toggle_thumbs_up
    # head 204
  end

  def likers
    @likers = Vote.new(object: @filtered_post).get_upvoters
    render :likers
  end

  def thumbed_upers
    @filtered_post = Post.find(params[:id])
    @thumbed_upers = VoteThumbsUp.new(object: @filtered_post).get_upvoters
    render :thumbed_upers
  end

  def smilers 
    @filtered_post = Post.find(params[:id])
    @smilers = VoteSmile.new(object: @filtered_post).get_upvoters
    render :smilers
  end

  private 
  def set_image 
    @image = FileUpload.new(
      file: params[:image],
      file_location: nil,
      action: params[:action]
    ).upload_image!
  end

  def set_filtered_post
    @filtered_post = Post.find(params[:id])
  end

  def set_post 
    @post = Post.find(params[:id])
  end
end
