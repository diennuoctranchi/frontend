module ApplicationHelper
	def root_link
		root_path
	end

	def about_us_link
		about_us_path
	end

	def contact_us_link
		contact_us_path
	end

	def diary_link
		diary_path
	end

	def faq_link
		faq_path
	end

	def service_list_link(service_category)
		service_list_path(service_category_id: service_category.id, service_category_alias: service_category.alias)
	end

	def service_detail_link(service)
		service_detail_path(service_id: service.id, service_alias: service.alias)
	end

	def blog_list_link
		blog_list_path
	end

	def blog_detail_link
		blog_detail_path
	end

	def image_set_tag(source, srcset = {}, options = {})
		srcset = srcset.map { |src, size| "#{path_to_image(src)} #{size}" }.join(', ')
		image_tag(source, options.merge(srcset: srcset))
	end
end