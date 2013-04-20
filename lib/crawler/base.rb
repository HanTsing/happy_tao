# encoding: utf-8
require 'rubygems'
require 'hpricot'
require 'nokogiri'
require 'open-uri'
require 'digest/md5'
require 'mini_magick'
module Crawler
  class Base

    def initialize(url)
      begin
        # @doc = Hpricot(open(url).read.to_s)
        @mi = Nokogiri::HTML(open(url).read.to_s)
      rescue
        # @doc = nil
        @mi = nil
      end
    end

    protected

    #def save_image(image_link)
       #begin
        #url = open(image_link)
        #MiniMagick::Image.read(url)
      #rescue => e
         #Rails.logger.info "=====>#{self}::#{__method__} error: #{e.inspect}"
      #end

    #end

    def generate_image_name(image_link)
      image_name = image_link.split('/').last.split('.').first
      !image_name.nil? ? Digest::MD5.hexdigest(image_name) : ""
    end

  end
end
