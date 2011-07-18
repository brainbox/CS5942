class Letter < ActiveRecord::Base
  
  belongs_to :language
belongs_to :letter_campaign

 def self.total_on(date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ?", date]).count
  end

  def self.lang_total_on(lang, start_date, end_date)
    #Letter.connection.execute("SELECT COUNT(id) FROM letters WHERE language_id = #{lang} AND created_at BETWEEN '#{start_date.to_date.strftime('%Y-%m-%d')}' and '#{end_date.to_date.strftime('%Y-%m-%d')}'")[0][0]
	
	Letter.where("language_id = #{lang} AND created_at between ? and ?", start_date.to_date, end_date.to_date).count
  end
  
  def self.tribe_total_on(tribe, start_date, end_date)
    #Letter.connection.execute("SELECT COUNT(id) FROM letters WHERE letter_campaign_id = #{tribe} AND created_at BETWEEN '#{start_date.to_date.strftime('%Y-%m-%d')}' and '#{end_date.to_date.strftime('%Y-%m-%d')}'")[0][0]
	end_date += 1.day # Had to include the one day to accomodate dates like 2011-06-05 01:02:03
	Letter.where("letter_campaign_id = #{tribe} AND created_at between ? and ?", start_date.to_date, end_date.to_date).count
  end
end