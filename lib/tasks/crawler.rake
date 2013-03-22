# encoding: utf-8

namespace :crawler_deal do
  desc %Q| 抓取网站 tao800_in deal, rake crawler_deal:grab_tao800_in|
  task :grab_tao800_in => :environment do
    site = CrawlerSite.where(name:"tao800_in").first
    Crawler::CrawlerRoleFinder.find_role(site).new(site.url).grab_deal
  end
end
