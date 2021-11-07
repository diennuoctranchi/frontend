class DiariesController < ApplicationController
	before_action :set_diary, only: [:image]
	
	def image
		send_file @diary.image_path(params[:thumb]), disposition: 'inline'
	end
	
	private
		def set_diary
			@diary = Diary.find(params[:id])
		end
end