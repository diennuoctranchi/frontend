class ServiceCategory < ApplicationRecord
  self.table_name = 'erp_electrical_service_categories'
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
end