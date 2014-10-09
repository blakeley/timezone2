class API::V1::ZonesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  before_action :authorize_user!, only: [:show]

  def index
    respond_with current_user.zones
  end

  def show
    respond_with zone
  end

  private

  def zone
    Zone.find(params[:id])
  end

  def authorize_user!
    if zone.user != current_user
      render status: :forbidden, json: {message: "You are not authorized to access this resource."}
    end
  end

end

