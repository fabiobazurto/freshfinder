class ZonesController < ApplicationController

  before_action :new_zone, only: [:index,:create]
  
  def index
  end

  def create
    @result = Zone.ready_to_delivery?(address: params[:address])  if params[:address].present?
    respond_to do |format|
        format.html { render :search }
    end
  end

  def zone_params
    params.fetch(:zone, {}).permit(:address)
  end

  private

  def new_zone
    @zone = Zone.new    
  end
  
end
