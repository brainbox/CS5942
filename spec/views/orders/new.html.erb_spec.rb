require 'spec_helper'

describe "orders/new.html.erb" do
  before(:each) do
    assign(:order, stub_model(Order,
      :number => 1,
      :shipping => "",
      :count => "MyString",
      :field => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_number", :name => "order[number]"
      assert_select "input#order_shipping", :name => "order[shipping]"
      assert_select "input#order_count", :name => "order[count]"
      assert_select "input#order_field", :name => "order[field]"
    end
  end
end
