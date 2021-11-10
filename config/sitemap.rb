require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://diennuoctranchi.com'
SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 0.9
  add about_us_path, :changefreq => 'weekly'
  add contact_us_path, :changefreq => 'weekly'

  add diary_path, :changefreq => 'weekly'
  Diary.get_active.each do |diary|
    add diary_icon_path(title: diary.alias, id: diary.id), :changefreq => 'weekly'
  end

  add faq_path, :changefreq => 'weekly'

  ServiceCategory.get_active.each do |service_category|
    add service_list_path(service_category_id: service_category.id, service_category_alias: service_category.alias), :changefreq => 'daily'
  end
  ServiceCategory.get_active.each do |service_category|
    add service_category_icon_path(title: service_category.alias, id: service_category.id), :changefreq => 'daily'
  end

  Service.get_active.each do |service|
    add service_detail_path(service_id: service.id, service_alias: service.alias), :changefreq => 'daily'
  end
  Service.get_active.each do |service|
    add service_image_path(title: service.alias, id: service.id), :changefreq => 'daily'
  end

  add blog_list_path, :changefreq => 'daily'
  Blog.get_active.each do |blog|
    add blog_detail_path(blog_id: blog.id, blog_alias: blog.alias), :changefreq => 'daily'
  end
  Blog.get_active.each do |blog|
    add blog_image_path(title: blog.alias, id: blog.id), :changefreq => 'daily'
  end
end
SitemapGenerator::Sitemap.ping_search_engines