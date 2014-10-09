class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session


  private

  def current_user
    id, access_token = request.headers[:HTTP_AUTHORIZATION].split(':')
    @current_user ||= User.where(id: id, access_token: access_token).first
  end

  def authenticate_user!
    unless current_user
      render status: :forbidden, json: {message: "Invalid authentication token."}
    end
  end

end
