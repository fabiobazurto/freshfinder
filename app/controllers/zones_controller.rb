class ZonesController < ApplicationController

  def index
    @zone = Zone.new
  end

  def create
    @zone = Zone.new
    p params[:address]
    @result = Zone.search(address: params[:address])  if params[:address].present?
    respond_to do |format|
        format.html { render :search }
    end

  end

  def zone_params
    params.fetch(:zone, {}).permit(:address)
  end

end
