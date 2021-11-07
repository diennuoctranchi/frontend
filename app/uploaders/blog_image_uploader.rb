class BlogImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :file

	def store_dir
		"/Volumes/Data/Code/diennuoctranchi/public/uploads/erp/electrical/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end
	
	version :detail_1920x750 do
		process resize_to_fill: [1920, 750]
	end

	version :detail_1536x600 do
		process resize_to_fill: [1536, 600]
	end

	version :detail_1040x400 do
		process resize_to_fill: [1040, 400]
	end

	version :detail_768x300 do
		process :resize_to_fill => [768, 300]
	end

	version :detail_600x234 do
		process :resize_to_fill => [600, 234]
	end

	version :detail_300x117 do
		process :resize_to_fill => [300, 117]
	end
end