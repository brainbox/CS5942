require 'spec_helper'

describe "orders/edit.html.erb" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :number => 1,
      :shipping => "",
      :count => "MyString",
      :field => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_number", :name => "order[number]"
      assert_select "input#order_shipping", :name => "order[shipping]"
      assert_select "input#order_count", :name => "order[count]"
      assert_select "input#order_field", :name => "order[field]"
    end
  end
end
