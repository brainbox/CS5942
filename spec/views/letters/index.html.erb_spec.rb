require 'spec_helper'

describe "letters/index.html.erb" do
  before(:each) do
    assign(:letters, [
      stub_model(Letter,
        :letter_campaign_id => 1,
        :language_id => 1,
        :supporter_id => 1,
        :country_code => "Country Code"
      ),
      stub_model(Letter,
        :letter_campaign_id => 1,
        :language_id => 1,
        :supporter_id => 1,
        :country_code => "Country Code"
      )
    ])
  end

  it "renders a list of letters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
  end
end
