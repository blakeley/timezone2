class API::V1::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.where(email: sign_in_params[:email]).first
    if user && user.authenticate(sign_in_params[:password])
      render status: :created, json: {token: user.authentication_token}
    else
      render status: :unauthorized, json: {message: "Invalid credentials"}
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

end
