class API::V1::ZonesController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    render status: :ok, nothing: true
  end

end
