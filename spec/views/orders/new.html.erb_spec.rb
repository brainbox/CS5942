require 'spec_helper'

describe "orders/new.html.erb" do
  before(:each) do
    assign(:order, stub_model(Order,
      :item => "MyString",
      :description => "MyString",
      :amount => 1.5,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_item", :name => "order[item]"
      assert_select "input#order_description", :name => "order[description]"
      assert_select "input#order_amount", :name => "order[amount]"
      assert_select "input#order_quantity", :name => "order[quantity]"
    end
  end
end
