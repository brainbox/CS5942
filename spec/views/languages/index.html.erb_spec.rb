require 'spec_helper'

describe "languages/index.html.erb" do
  before(:each) do
    assign(:languages, [
      stub_model(Language,
        :lang_code => "Lang Code",
        :lang_name => "Lang Name",
        :short_code => "Short Code",
        :i18n_identifier => "I18n Identifier",
        :custom_css => 1,
        :active => 1,
        :in_menus => 1,
        :default_domain_id => 1,
        :root_slug => "Root Slug"
      ),
      stub_model(Language,
        :lang_code => "Lang Code",
        :lang_name => "Lang Name",
        :short_code => "Short Code",
        :i18n_identifier => "I18n Identifier",
        :custom_css => 1,
        :active => 1,
        :in_menus => 1,
        :default_domain_id => 1,
        :root_slug => "Root Slug"
      )
    ])
  end

  it "renders a list of languages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lang Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lang Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "I18n Identifier".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Root Slug".to_s, :count => 2
  end
end
