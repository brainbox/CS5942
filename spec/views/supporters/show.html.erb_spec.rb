require 'spec_helper'

describe "supporters/show.html.erb" do
  before(:each) do
    @supporter = assign(:supporter, stub_model(Supporter,
      :language_id => 1,
      :country_code => "Country Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country Code/)
  end
end
