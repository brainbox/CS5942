require 'test_helper'

class LetterCampaignTest < ActiveSupport::TestCase

	test "Total for given day" do
		expected = LetterCampaign.find(:all, :conditions => "date(created_at) = '#{ (Date.today - 1.day).to_date.strftime('%Y-%m-%d')}' and name = 'Test Tribe'").count
		data = LetterCampaign.tribe_total_on('Test Tribe', (Date.today - 1.day).to_date.strftime('%Y-%m-%d'))
		
		assert_equal expected,data
	end
	
	test "All distinct Campaign names" do
		campaigns = Array.new
		camp = LetterCampaign.find(:all).each do |campaign|
		campaigns.push campaign.name unless campaigns.include?(campaign.name)
	end
		expected = campaigns.sort
		data = LetterCampaign.get_all_campaign_names
		
		assert_equal expected,data
	end
	
	
	
end