class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    if auth_hash.present?
      # Oath2 authentication
      user = User.from_omniauth(auth_hash)
      token = Token.new(user_id: user.id).encode
      render json: { token: token }
    else
      # JWT authentication
      @user = User.find_by_credentials(email, password)

      if @user.nil?
        render json: { message: "Invalid credentials" }, status: :bad_request
      else
        @token = Token.new(user_id: @user.id).encode
        render :new
      end
    end
  end

  # Failure callback
  def failure
    render json: { message: 'Authentication failed' }, status: :unauthorized
  end

  def show
    @current_user = current_user
    render :show
  end

  private

  def email
    params.dig(:user, :email)
  end

  def password
    params.dig(:user, :password)
  end
end
