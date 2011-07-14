class Letter < ActiveRecord::Base
  
  belongs_to :language
belongs_to :letter_campaign

 def self.total_on(date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ?", date]).count
  end

  def self.lang_total_on(lang, start_date, end_date)
    ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM letters WHERE language_id = #{lang} AND created_at BETWEEN '#{start_date.to_date.to_s}' and '#{end_date.to_date.to_s}'")[0][0]
  end
  
  def self.tribe_total_on(tribe, start_date, end_date)
    ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM letters WHERE letter_campaign_id = #{tribe} AND created_at BETWEEN '#{start_date.to_date.to_s}' and '#{end_date.to_date.to_s}'")[0][0]
  
end
end