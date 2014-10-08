class API::V1::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      render status: :created, nothing: true
    else
      render status: :bad_request, json: {errors: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
