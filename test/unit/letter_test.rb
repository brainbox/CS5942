require 'test_helper'

class LetterTest < ActiveSupport::TestCase

	test "Total for a given date range for languages" do
		end_date = (Date.today + 1.day).to_date.strftime('%Y-%m-%d')
		expected = Letter.where("language_id = '1' and created_at between '#{ (Date.today - 1.day).to_date.strftime('%Y-%m-%d')}' and '#{end_date}'").count
		data = Letter.lang_total_on( 1 , (Date.today - 1.day).to_date.strftime('%Y-%m-%d') , (Date.today).to_date.strftime('%Y-%m-%d') )
		
		assert_equal expected,data

	end
	
	test "Total for a given date range for Campaigns" do
		
		end_date = (Date.today + 1.day).to_date.strftime('%Y-%m-%d')
		expected = Letter.where("letter_campaign_id = '1' and created_at between '#{ (Date.today - 1.day).to_date.strftime('%Y-%m-%d')}' and '#{end_date}'").count
		data = Letter.tribe_total_on( 1 , (Date.today - 1.day).to_date.strftime('%Y-%m-%d') , (Date.today).to_date.strftime('%Y-%m-%d'))
		
		assert_equal expected,data

	end
	
end