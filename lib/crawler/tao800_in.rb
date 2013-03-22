module Crawler
 class Tao800In < Base

  def grab_deal

    (@doc/".sl_box").each do|div|
        image_link_element  = div/'.sl_box_img/a'
        title_element   = div/'.sl_box_tex/a'
        price_element   = div/'.sl_box_lov/.sl_b_l_r'
        count_element   = div/'.sl_box_lov/.sl_b_l_l/strong'
        link_element    = image_link_element.first['href']

        title = title_element.inner_html
        price = price_element.inner_html.gsub(/^\D/, '').to_f
        count = count_element.inner_html.gsub(/\D/, '')
        image_link = image_link_element.at('img')['src']
        image_name = generate_image_name(image_link)
        deal_href     = image_link_element.first

        deal = ::Deal.new(title:title, count:count, price:price, link:image_link)
        deal.image = save_image(image_link)
        deal.save
    end
  end

 end
end

#Crawler::Crawler.new("http://www.tao800.in/item/9.9.html").grab_deal
