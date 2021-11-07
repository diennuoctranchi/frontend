class Diary < ApplicationRecord
	self.table_name = 'erp_electrical_diaries'
	mount_uploader :image, DiaryImageUploader

	def self.get_active
    self.order('custom_order asc')
  end

	def get_name
		self.name
	end

	def image_path(version = nil)
    if !version.nil?
      return self.image_url(version)
    else
      return self.image_url
    end
  end
  
  def diary_image(version = nil)
    ActionView::Base.send(:include, Rails.application.routes.url_helpers)
    link_helper = ActionController::Base.helpers
    
    link_helper.url_for(controller: 'diaries', action: 'image', title: self.alias, id: self.id, thumb: version)
  end
end