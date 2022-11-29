class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid,with: :record_invalid
rescue_from ActiveRecord::RecordNotFound,with: :not_found
  def create
    user = User.create!(user_params)
    session[:user_id] = user.user_id
    render json: user, status: :created
  end
  def show
    user = User.find(session[:user_id])
    render json: user
  end
  private
  def user_params
    params.permit(:username, :password_confirmation, :image_url, :bio)
  end
  def record_invalid
    render json: {error:invalid.record.errors.full_messages},status: :unprocessable_entity
  end
  def not_found
    render json: {errors: "User not found"},status: :unauthorized
  end
end
