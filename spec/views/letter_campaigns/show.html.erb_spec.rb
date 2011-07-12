require 'spec_helper'

describe "letter_campaigns/show.html.erb" do
  before(:each) do
    @letter_campaign = assign(:letter_campaign, stub_model(LetterCampaign,
      :name => "Name",
      :slug => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
