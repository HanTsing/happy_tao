require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'iconv'
require 'digest/md5'
require 'mini_magick'
module Crawler
  class Base

    def initialize(url)
      begin
        @doc = Hpricot(Iconv.conv("UTF-8//IGNORE","GBK//IGNORE",open(url).read.to_s))
      rescue
        @doc = nil
      end
    end

    protected

    def save_image(image_link)
       begin
        url = open(image_link)
        MiniMagick::Image.read(url)
      rescue => e
         Rails.logger.info "=====>#{self}::#{__method__} error: #{e.inspect}"
      end

    end

    def generate_image_name(image_link)
      image_name = image_link.split('/').last.split('.').first
      !image_name.nil? ? Digest::MD5.hexdigest(image_name) : ""
    end

  end
end