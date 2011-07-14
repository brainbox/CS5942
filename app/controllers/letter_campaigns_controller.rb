class LetterCampaignsController < ApplicationController
  # GET /letter_campaigns
  # GET /letter_campaigns.xml
  
  def index
    if params[:first] && params[:last]
      @letter_campaigns = LetterCampaign.all
      @first = Time.parse(params[:first])
      @last = Time.parse(params[:last])
      
      if @first == @last
	# no date range....fLASH ERROR MESSAGE
	flash[:notice] = "You can not select the same date"
	
      elsif @first > @last
	# fisr is after last
	
      end
      
      @series = {}
      @letter_campaigns.each do |letter_campaign|
	    series_data = Array.new
	    (@first.to_i..@last.to_i).step(1.week).each do |date|
		  date = Time.at(date)
		  series_data.push letter_campaign.letters.tribe_total_on(letter_campaign.id, date, (date + 1.week))
		end
        @series[letter_campaign.name] = series_data.inspect
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @letter_campaigns }
    end
  end
  
  

  # GET /letter_campaigns/1
  # GET /letter_campaigns/1.xml
  def show
    @letter_campaign = LetterCampaign.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @letter_campaign }
    end
  end

  # GET /letter_campaigns/new
  # GET /letter_campaigns/new.xml
  def new
    @letter_campaign = LetterCampaign.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @letter_campaign }
    end
  end

  # GET /letter_campaigns/1/edit
  def edit
    @letter_campaign = LetterCampaign.find(params[:id])
  end

  # POST /letter_campaigns
  # POST /letter_campaigns.xml
  def create
    @letter_campaign = LetterCampaign.new(params[:letter_campaign])

    respond_to do |format|
      if @letter_campaign.save
        format.html { redirect_to(@letter_campaign, :notice => 'Letter campaign was successfully created.') }
        format.xml  { render :xml => @letter_campaign, :status => :created, :location => @letter_campaign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @letter_campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /letter_campaigns/1
  # PUT /letter_campaigns/1.xml
  def update
    @letter_campaign = LetterCampaign.find(params[:id])

    respond_to do |format|
      if @letter_campaign.update_attributes(params[:letter_campaign])
        format.html { redirect_to(@letter_campaign, :notice => 'Letter campaign was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @letter_campaign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /letter_campaigns/1
  # DELETE /letter_campaigns/1.xml
  def destroy
    @letter_campaign = LetterCampaign.find(params[:id])
    @letter_campaign.destroy

    respond_to do |format|
      format.html { redirect_to(letter_campaigns_url) }
      format.xml  { head :ok }
    end
  end
end
