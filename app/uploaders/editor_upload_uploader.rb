class EditorUploadUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :file
	
	def store_dir
		"/Volumes/Data/Code/diennuoctranchi/public/uploads/erp/editor_upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end
end