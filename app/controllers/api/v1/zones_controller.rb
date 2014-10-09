class API::V1::ZonesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    respond_with current_user.zones
  end

end
