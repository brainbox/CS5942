class Letter < ActiveRecord::Base
  
  belongs_to :language
belongs_to :letter_campaign

 def self.total_on(date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ?", date]).count
  end

  def self.lang_total_on(lang, date)
    find(:all,:conditions => ["date(created_at) = ? AND language_id = ?", date, lang]).count
  end
  
end
