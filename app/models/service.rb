class Service < ApplicationRecord
  self.table_name = 'erp_electrical_services'
  belongs_to :service_category, class_name: 'ServiceCategory'
  mount_uploader :image, ServiceImageUploader

  def self.get_active
    self.order('created_at desc')
  end

  def self.get_best_choice_services
    self.get_active.where(is_best_choice: true)
  end

  def get_name
    self.name
  end
  
  def get_title
    self.title
  end
  
  def get_service_category_name
    service_category.present? ? service_category.get_name : ''
  end
  
  def get_service_category_full_name
    service_category.present? ? service_category.get_full_name : ''
  end

  def image_path(version = nil)
    if !version.nil?
      return self.image_url(version)
    else
      return self.image_url
    end
  end
  
  def service_image(version = nil)
    ActionView::Base.send(:include, Rails.application.routes.url_helpers)
    link_helper = ActionController::Base.helpers
    
    link_helper.url_for(controller: 'services', action: 'image', title: self.alias, id: self.id, thumb: version)
  end
end