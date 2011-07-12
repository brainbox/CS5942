class LetterCampaignsController < ApplicationController
  # GET /letter_campaigns
  # GET /letter_campaigns.xml
  def index
    @letter_campaigns = LetterCampaign.all

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
