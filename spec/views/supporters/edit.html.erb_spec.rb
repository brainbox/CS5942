require 'spec_helper'

describe "supporters/edit.html.erb" do
  before(:each) do
    @supporter = assign(:supporter, stub_model(Supporter,
      :language_id => 1,
      :country_code => "MyString"
    ))
  end

  it "renders the edit supporter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supporters_path(@supporter), :method => "post" do
      assert_select "input#supporter_language_id", :name => "supporter[language_id]"
      assert_select "input#supporter_country_code", :name => "supporter[country_code]"
    end
  end
end
