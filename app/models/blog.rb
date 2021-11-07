class Blog < ApplicationRecord
	self.table_name = 'erp_electrical_blogs'
	mount_uploader :image, BlogImageUploader

	def self.get_active
		self.order('created_at DESC')
	end

	def get_name
		self.name
	end
	
	def get_title
		self.title
	end

	def image_path(version = nil)
    if !version.nil?
      return self.image_url(version)
    else
      return self.image_url
    end
  end
  
  def blog_image(version = nil)
    ActionView::Base.send(:include, Rails.application.routes.url_helpers)
    link_helper = ActionController::Base.helpers
    
    link_helper.url_for(controller: 'blogs', action: 'image', title: self.alias, id: self.id, thumb: version)
  end
end