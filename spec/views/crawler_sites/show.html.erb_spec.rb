require 'spec_helper'

describe "crawler_sites/show" do
  before(:each) do
    @crawler_site = assign(:crawler_site, stub_model(CrawlerSite,
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
  end
end
