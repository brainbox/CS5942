require 'spec_helper'

describe "letters/show.html.erb" do
  before(:each) do
    @letter = assign(:letter, stub_model(Letter,
      :letter_campaign_id => 1,
      :language_id => 1,
      :supporter_id => 1,
      :country_code => "Country Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country Code/)
  end
end
