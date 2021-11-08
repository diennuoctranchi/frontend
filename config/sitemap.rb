require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://diennuoctranchi.com'
SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 0.9
  add about_us_path, :changefreq => 'weekly'
  add contact_us_path, :changefreq => 'weekly'
  add diary_path, :changefreq => 'weekly'
  add faq_path, :changefreq => 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks