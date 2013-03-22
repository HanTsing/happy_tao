require 'spec_helper'

describe "crawler_sites/new" do
  before(:each) do
    assign(:crawler_site, stub_model(CrawlerSite,
      :name => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new crawler_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crawler_sites_path, "post" do
      assert_select "input#crawler_site_name[name=?]", "crawler_site[name]"
      assert_select "input#crawler_site_url[name=?]", "crawler_site[url]"
    end
  end
end
