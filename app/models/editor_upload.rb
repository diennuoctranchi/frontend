class EditorUpload < ApplicationRecord
	self.table_name = 'erp_editor_uploads'
  mount_uploader :image_url, EditorUploadUploader
end