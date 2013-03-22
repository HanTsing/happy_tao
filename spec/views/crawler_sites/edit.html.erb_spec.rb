require 'spec_helper'

describe "crawler_sites/edit" do
  before(:each) do
    @crawler_site = assign(:crawler_site, stub_model(CrawlerSite,
      :name => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit crawler_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crawler_site_path(@crawler_site), "post" do
      assert_select "input#crawler_site_name[name=?]", "crawler_site[name]"
      assert_select "input#crawler_site_url[name=?]", "crawler_site[url]"
    end
  end
end
