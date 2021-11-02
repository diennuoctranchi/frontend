class ServicesController < ApplicationController
  before_action :set_service, only: [:image]
  
  def image
    send_file @service.image_path(params[:thumb]), disposition: 'inline'
  end
  
  private
    def set_service
      @service = Service.find(params[:id])
    end
end