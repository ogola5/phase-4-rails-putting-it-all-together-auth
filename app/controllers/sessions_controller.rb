class SessionsController < ApplicationController
  def create
    user = User.find(username :params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render json: {error: "Username or Password Incorrect"}, status: :unauthorized
    end
  end

  def destroy
    if session[:user_id]
      session.destroy
      head :no_content
    else
      render json: {error: ["User not logged in"]}, status: :unauthorized
    end
  end
end
