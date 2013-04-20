# encoding: utf-8

namespace :crawler_deal do
  desc %Q| 抓取网站 tao800_in deal, rake crawler_deal:grab_tao800_in|
  task :grab_tao800_in => :environment do
    site = CrawlerSite.where(name:"tao800_in").first
    Crawler::CrawlerRoleFinder.find_role(site).new(site.url).grab_deal
  end

  desc %Q| 抓取网站 mi56_com deal, rake crawler_deal:grab_mi56_com|
  task :grab_mi56_com => :environment do
  	site = CrawlerSite.where(name:"mi56_com").first
  	Crawler::CrawlerRoleFinder.find_role(site).new(site.url).grab_sort_and_deal
  end
end
