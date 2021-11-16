Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'frontend/home#index'

  get '/gioi-thieu' => 'frontend/information#about', as: :about_us
  get '/lien-he' => 'frontend/information#contact', as: :contact_us

  get '/nhat-ky-cong-viec' => 'frontend/information#diary', as: :diary
  get '/hinh-anh-nhat-ky-cong-viec/:title-cid:id(/:thumb)' => 'diaries#image', as: :diary_icon

  get '/cau-hoi-thuong-gap' => 'frontend/information#faq', as: :faq

  get '/chuyen-muc/:service_category_alias-cid:service_category_id' => 'frontend/service#list', as: :service_list
  get '/icon-chuyen-muc/:title-cid:id(/:thumb)' => 'service_categories#image', as: :service_category_icon

  get '/chi-tiet/:service_alias-cid:service_id' => 'frontend/service#detail', as: :service_detail
  get '/hinh-anh-dich-vu/:title-cid:id(/:thumb)' => 'services#image', as: :service_image

  get '/chia-se-kinh-nghiem' => 'frontend/blog#list', as: :blog_list
  get '/chia-se-kinh-nghiem/:blog_alias-cid:blog_id' => 'frontend/blog#detail', as: :blog_detail
  get '/hinh-anh-chia-se-kinh-nghiem/:title-cid:id(/:thumb)' => 'blogs#image', as: :blog_image

  patch '/editor/upload' => 'editor_uploads#upload'
end