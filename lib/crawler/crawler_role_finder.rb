module Crawler
  class CrawlerRoleFinder
    def self.find_role(site, tag = nil)
      "Crawler::#{site.name.classify}".constantize
    end
  end
end
