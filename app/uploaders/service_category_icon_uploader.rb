class ServiceCategoryIconUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :file
	
	def store_dir
		"/Volumes/Data/Code/diennuoctranchi/public/uploads/erp/electrical/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end
	
	version :detail_40x40 do
			process resize_to_fill: [40, 40]
	end
end