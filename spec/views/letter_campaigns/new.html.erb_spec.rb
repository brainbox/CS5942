require 'spec_helper'

describe "letter_campaigns/new.html.erb" do
  before(:each) do
    assign(:letter_campaign, stub_model(LetterCampaign,
      :name => "MyString",
      :slug => ""
    ).as_new_record)
  end

  it "renders new letter_campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => letter_campaigns_path, :method => "post" do
      assert_select "input#letter_campaign_name", :name => "letter_campaign[name]"
      assert_select "input#letter_campaign_slug", :name => "letter_campaign[slug]"
    end
  end
end
