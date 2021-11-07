class ServiceCategoriesController < ApplicationController
  before_action :set_service_category, only: [:image]
  
  def image
    send_file @service_category.image_path(params[:thumb]), disposition: 'inline'
  end
  
  private
    def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end
end