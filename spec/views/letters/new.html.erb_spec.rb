require 'spec_helper'

describe "letters/new.html.erb" do
  before(:each) do
    assign(:letter, stub_model(Letter,
      :letter_campaign_id => 1,
      :language_id => 1,
      :supporter_id => 1,
      :country_code => "MyString"
    ).as_new_record)
  end

  it "renders new letter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => letters_path, :method => "post" do
      assert_select "input#letter_letter_campaign_id", :name => "letter[letter_campaign_id]"
      assert_select "input#letter_language_id", :name => "letter[language_id]"
      assert_select "input#letter_supporter_id", :name => "letter[supporter_id]"
      assert_select "input#letter_country_code", :name => "letter[country_code]"
    end
  end
end
