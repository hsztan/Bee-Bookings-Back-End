class Api::V1::SessionsController < ApplicationController
  def sign_in
    @user = User.find_by(username: user_params[:username])
    if @user
      render json: { 
        user_id: @user.id,
        username: @user.username 
      }
    else
      render json: { error: "User not found" },
        status: 404
    end
  end

  def sign_up
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
