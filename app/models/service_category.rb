class ServiceCategory < ApplicationRecord
  self.table_name = 'erp_electrical_service_categories'
  mount_uploader :icon, ServiceCategoryIconUploader
  belongs_to :parent, class_name: 'ServiceCategory', optional: true
  has_many :children, class_name: 'ServiceCategory', foreign_key: 'parent_id'
  has_many :services, class_name: 'Service'

  def self.get_active
    self.order("custom_order asc")
  end

  def get_title
    self.title
  end

  def get_name
    self.name
  end

  def get_short_description
    self.short_description
  end

  def get_meta_keywords
    self.meta_keywords
  end

  def get_meta_description
    self.meta_description
  end

  def get_parent_name
    self.parent.present? ? self.parent.get_full_name : ''
  end

  def get_services_for_service_categories(params)
    records = Service.get_active.where(service_category_id: self.get_self_and_children_ids)
    return records
  end

  def get_best_choice_services_for_service_categories
    records = Service.get_best_choice_services.where(service_category_id: self.get_self_and_children_ids)
    return records
  end

  def self.get_categories
    self.get_active.where(parent_id: nil)
  end

  def get_children_categories
    self.children.get_active
  end

  def get_self_and_children_ids
    ids = [self.id]
    ids += get_children_ids_recursive
    return ids
  end

  def get_children_ids_recursive
    ids = []
    children.each do |c|
      if !c.children.empty?
        ids += c.get_children_ids_recursive
      end
        ids << c.id
    end
    return ids
  end

  def image_path(version = nil)
    if !version.nil?
      return self.icon_url(version)
    else
      return self.icon_url
    end
  end
  
  def service_category_icon(version = nil)
    ActionView::Base.send(:include, Rails.application.routes.url_helpers)
    link_helper = ActionController::Base.helpers
    
    link_helper.url_for(controller: 'service_categories', action: 'image', title: self.alias, id: self.id, thumb: version)
  end
end