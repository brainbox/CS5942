require 'test_helper'

class LetterCampaignsControllerTest < ActionController::TestCase

  def contains_form
    # TODO: Add assertions to ensure response contains the form
  end
  
  def contains_graph
    # TODO: Add assertions to make sure response contains the graph
  end

  test "Test sucessfully get index with no parameters" do
    get :index
	assert_response :success
	contains_form
  end

  test "Test sucessfully get index with correct parameters" do
    get :index, :get=>{:first=>'2011-05-01', :last=>'2011-05-28', :interval=>'7', :campaign0=>'awa'}
	assert_response :success
	contains_form
	contains_graph
  end

  test "Test sucessfully get index with bad start date" do
    get :index, :get=>{:first=>'', :last=>'2011-05-28', :interval=>'7', :campaign0=>'awa'}
	assert_response :success
	contains_form
  end

  test "Test sucessfully get index with bad end date" do
    get :index, :get=>{:first=>'2011-05-01', :last=>'', :interval=>'7', :campaign0=>'awa'}
	assert_response :success
	contains_form
  end

  test "Test sucessfully get index with start date after end date" do
    get :index, :get=>{:first=>'2011-05-28', :last=>'2011-05-01', :interval=>'7', :campaign0=>'awa'}
	assert_response :success
	contains_form
	assert_equal 'End date must be after start date', flash.now_cache[:notice]
  end

  test "Test sucessfully get index with start date equal end date" do
    get :index, :get=>{:first=>'2011-05-28', :last=>'2011-05-01', :interval=>'7', :campaign0=>'awa'}
	assert_response :success
	contains_form
	assert_equal 'You can not select the same date', flash.now_cache[:notice]
  end

  test "Test sucessfully get index with bad interval" do
    get :index, :get=>{:first=>'2011-05-01', :last=>'2011-05-28', :interval=>'-7', :campaign0=>'awa'}
	assert_response :success
	contains_form
  end

  test "Test sucessfully get index with no campaigns selected" do
    get :index, :get=>{:first=>'2011-05-01', :last=>'2011-05-28', :interval=>'7'}
	assert_response :success
	contains_form
  end

  test "Test sucessfully get index with bad campaigns selected" do
    get :index, :get=>{:first=>'2011-05-01', :last=>'2011-05-28', :interval=>'7', :campaign0=>'abc123'}
	assert_response :success
	contains_form
  end
end
