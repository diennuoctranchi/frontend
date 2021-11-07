class DiaryImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :file
	
	def store_dir
		"/Volumes/Data/Code/diennuoctranchi/public/uploads/erp/electrical/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end
	
	version :detail_370x260 do
		process resize_to_fill: [370, 260]
	end

	version :detail_740x520 do
		process resize_to_fill: [740, 520]
	end
end