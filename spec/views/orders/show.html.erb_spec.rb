require 'spec_helper'

describe "orders/show.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :number => 1,
      :shipping => "",
      :count => "Count",
      :field => "Field"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Count/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field/)
  end
end
