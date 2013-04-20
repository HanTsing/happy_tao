# encoding: utf-8
module Crawler
 class Mi56Com < Base

  def grab_sort_and_deal
  	doc = grab_sort
  	doc.each do |key,value|
  		flag = ::Sort.find_by(name: key) rescue nil
  		if flag==nil
	  		flag = ::Sort.create!(name: key)
  		end
  		get_deal(value,flag)
  	end
  end

  def grab_sort
  	doc = {}
  	@mi.at_css("div.subnav_b").xpath(".//a").each do |a|
  		name = a.content
  		link = a[:href]
  		doc["#{name}"] = link
  	end
  	puts doc
  	return doc
  end

  def get_deal(link,flag)
    puts "link---------------------#{link}"
  	doc = Nokogiri::HTML(open(link).read.to_s)
  	page_num = doc.at_css("div.s_page").xpath(".//a")[-2][:href].match(/\d+/).to_s.to_i rescue 1
  	puts "页数==============>#{page_num}"
  	1.upto page_num do |x|
  		unless x==1
  			lk = link.split(".html").first + "_#{x}.html"
  			doc = Nokogiri::HTML(open(lk).read.to_s)
  		end
		doc.css("div.sbox").each do |div|
			title = div.at_css("div.sbox_nam a").content
			price = div.at_css("span.sbox_buy_now b").content.to_f
			count = div.at_css("span.sbox_pri_salescount b").content.to_i
			lik = "http://www.56mi.com" + div.at_css("div.sbox_nam a")[:href].to_s
			image_link = div.at_css("div.sbox_img a img")[:src].to_s		
			image_name = generate_image_name(image_link)
			al = Nokogiri::HTML(open(lik).read.to_s)
			source_link = al.to_s.match(/gotarget\('(.+?)'\)/)[1].to_s
      puts title,price,count,image_link,image_name,source_link
			puts "deal-----------------------------"
			a = flag.deals.create(title: title, price: price, count: count, image_link: image_link, image_name: image_name, link: source_link)
		  puts a.to_json
    end
  	end
  end

 end
end