require 'spec_helper'

describe "languages/show.html.erb" do
  before(:each) do
    @language = assign(:language, stub_model(Language,
      :lang_code => "Lang Code",
      :lang_name => "Lang Name",
      :short_code => "Short Code",
      :i18n_identifier => "I18n Identifier",
      :custom_css => 1,
      :active => 1,
      :in_menus => 1,
      :default_domain_id => 1,
      :root_slug => "Root Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lang Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lang Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/I18n Identifier/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Root Slug/)
  end
end
