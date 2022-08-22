class Api::V1::SessionsController < ApplicationController
  def sign_in
    @user = User.find_by(username: user_params[:username])
    if @user
      render json: {
        user_id: @user.id,
        username: @user.username
      }, status: 200
    else
      render json: { error: 'User not found' },
             status: :not_found
    end
  end

  def sign_up
    @user = User.new(username: user_params[:username])

    if @user.save
      render json: {
        user_id: @user.id,
        username: @user.username
      }, status: 200
    else
      render json: { errors: @user.errors },
             status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
