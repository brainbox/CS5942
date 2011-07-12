require 'spec_helper'

describe "supporters/index.html.erb" do
  before(:each) do
    assign(:supporters, [
      stub_model(Supporter,
        :language_id => 1,
        :country_code => "Country Code"
      ),
      stub_model(Supporter,
        :language_id => 1,
        :country_code => "Country Code"
      )
    ])
  end

  it "renders a list of supporters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
  end
end
