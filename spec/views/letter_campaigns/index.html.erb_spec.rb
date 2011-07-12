require 'spec_helper'

describe "letter_campaigns/index.html.erb" do
  before(:each) do
    assign(:letter_campaigns, [
      stub_model(LetterCampaign,
        :name => "Name",
        :slug => ""
      ),
      stub_model(LetterCampaign,
        :name => "Name",
        :slug => ""
      )
    ])
  end

  it "renders a list of letter_campaigns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
