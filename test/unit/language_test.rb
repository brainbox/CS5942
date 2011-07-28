require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
	
	test "Total Languages for given day" do
		expected = Language.find(:all, :conditions => "date(created_at) = '#{ (Date.today - 1.day).to_date.strftime('%Y-%m-%d')}' and lang_name = 'English'").count
		data = Language.lang_total_on('English', (Date.today - 1.day).to_date.strftime('%Y-%m-%d'))
		
		assert_equal expected,data
	end

end