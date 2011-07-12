require 'spec_helper'

describe "languages/new.html.erb" do
  before(:each) do
    assign(:language, stub_model(Language,
      :lang_code => "MyString",
      :lang_name => "MyString",
      :short_code => "MyString",
      :i18n_identifier => "MyString",
      :custom_css => 1,
      :active => 1,
      :in_menus => 1,
      :default_domain_id => 1,
      :root_slug => "MyString"
    ).as_new_record)
  end

  it "renders new language form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => languages_path, :method => "post" do
      assert_select "input#language_lang_code", :name => "language[lang_code]"
      assert_select "input#language_lang_name", :name => "language[lang_name]"
      assert_select "input#language_short_code", :name => "language[short_code]"
      assert_select "input#language_i18n_identifier", :name => "language[i18n_identifier]"
      assert_select "input#language_custom_css", :name => "language[custom_css]"
      assert_select "input#language_active", :name => "language[active]"
      assert_select "input#language_in_menus", :name => "language[in_menus]"
      assert_select "input#language_default_domain_id", :name => "language[default_domain_id]"
      assert_select "input#language_root_slug", :name => "language[root_slug]"
    end
  end
end
