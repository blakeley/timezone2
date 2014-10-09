class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_default_format
  rescue_from ActiveRecord::RecordNotFound, with: :render_404


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

  def set_default_format
    request.format = :json unless params[:format] 
  end

  def render_404
    render status: :not_found, nothing: true
  end

end
