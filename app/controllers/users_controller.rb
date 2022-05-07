class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def index
    @users = User.search(params[:q])
  end

  def create
    @user = User.new(create_user_params)

    if @user.save
      @token = Token.new(user_id: @user.id).encode
      render :new, status: :created
    else
      render json: {message: @user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find_by(username: params[:id])
  end

  def update
    @user = User.find(params[:id])

    if user_updated?(@user)
      @token = Token.new(user_id: @user.id).encode
      render :edit
    else
      render json: {message: @user.errors.full_messages}, status: :bad_request
    end
  end

  def following
    user = User.find_by(username: params[:id])
    @users = user.following.all
    render :show_follow
  end

  def followers
    user = User.find_by(username: params[:id])
    @users = user.followers.all
    render :show_follow
  end

  def media_posts
    user = User.find(params[:id])
    @posts = user.posts.consist_images
    render :index_user_media_post
  end

  def liked_posts
    user = User.find(params[:id])
    @posts = user.get_voted(Post)
    render :index_user_liked_post
  end

  def smiled_on_posts
    user = User.find(params[:id])
    @posts = user.get_voted(Post)
    render :index_user_smiled_on_posts
  end

  def thumbed_up_posts
    user = User.find(params[:id])
    @posts = user.get_voted(Post)
    render :index_user_thumbed_up_posts
  end

  def commented_posts
    user = User.find(params[:id])
    @posts = Post.with_comments_from(user)
    render :index_user_commented_post
  end

  private

  def create_user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def user_updated?(user)
    avatar =
      FileUpload.new(
        file: params[:avatar],
        file_location: user.avatar,
        action: params[:action]
      ).upload_image!

    banner =
      FileUpload.new(
        file: params[:banner],
        file_location: user.banner,
        action: params[:action]
      ).upload_image!

    user.update(
      name: params[:name],
      bio: params[:bio],
      location: params[:location],
      website: params[:website],
      avatar: avatar["url"] || params[:avatar],
      banner: banner["url"] || params[:banner]
    )
  end
end
