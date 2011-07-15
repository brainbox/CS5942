class LanguagesController < ApplicationController
before_filter :ensure_is_signed_in
 
  # GET /languages
  # GET /languages.xml
   def index
    if params[:first] && params[:last]
      @languages = Language.all
      @first = Time.parse(params[:first])
      @last = Time.parse(params[:last])
      
      if @first == @last
	# no date range....fLASH ERROR MESSAGE
	flash[:notice] = "You can not select the same date"
	
      elsif @first > @last
	# fisr is after last
	
      end
      
      @series = {}
      @languages.each do |language|
	    series_data = Array.new
	    (@first.to_i..@last.to_i).step(1.week).each do |date|
		  date = Time.at(date)
		  series_data.push language.letters.lang_total_on(language.id, date, (date + 1.week))
		end
        @series[language.lang_name] = series_data.inspect
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @languages }
    end
  end


  # GET /languages/1
  # GET /languages/1.xml
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.xml
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
  end

  # POST /languages
  # POST /languages.xml
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to(@language, :notice => 'Language was successfully created.') }
        format.xml  { render :xml => @language, :status => :created, :location => @language }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.xml
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to(@language, :notice => 'Language was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.xml
  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to(languages_url) }
      format.xml  { head :ok }
    end
  end
end
