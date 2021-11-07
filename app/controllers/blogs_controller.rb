class BlogsController < ApplicationController
	before_action :set_blog, only: [:image]
	
	def image
		send_file @blog.image_path(params[:thumb]), disposition: 'inline'
	end
	
	private
		def set_blog
			@blog = Blog.find(params[:id])
		end
end