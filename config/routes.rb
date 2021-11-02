Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'frontend/home#index'

  get '/gioi-thieu' => 'frontend/information#about', as: :about_us
  get '/lien-he' => 'frontend/information#contact', as: :contact_us
  get '/nhat-ky-cong-viec' => 'frontend/information#diary', as: :diary
  get '/cau-hoi-thuong-gap' => 'frontend/information#faq', as: :faq

  get '/chuyen-muc/:service_category_alias-cid:service_category_id' => 'frontend/service#list', as: :service_list
  get '/chi-tiet/:service_alias-cid:service_id' => 'frontend/service#detail', as: :service_detail
  get '/hinh-anh-dich-vu/:title/:id(/:thumb)' => 'services#image', as: :service_image

  get '/chia-se-kinh-nghiem' => 'frontend/blog#list', as: :blog_list
  get '/chi-tiet-chia-se-kinh-nghiem' => 'frontend/blog#detail', as: :blog_detail
end