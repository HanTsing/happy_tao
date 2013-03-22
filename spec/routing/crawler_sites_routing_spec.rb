require "spec_helper"

describe CrawlerSitesController do
  describe "routing" do

    it "routes to #index" do
      get("/crawler_sites").should route_to("crawler_sites#index")
    end

    it "routes to #new" do
      get("/crawler_sites/new").should route_to("crawler_sites#new")
    end

    it "routes to #show" do
      get("/crawler_sites/1").should route_to("crawler_sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crawler_sites/1/edit").should route_to("crawler_sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crawler_sites").should route_to("crawler_sites#create")
    end

    it "routes to #update" do
      put("/crawler_sites/1").should route_to("crawler_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crawler_sites/1").should route_to("crawler_sites#destroy", :id => "1")
    end

  end
end
