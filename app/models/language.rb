class Language < ActiveRecord::Base
  
  has_many :letters
 def self.total_on(date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ?", date]).count
  end
 def self.lang_total_on(lang, date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ? AND lang_name = ?", date, lang]).count
  end
  
  def user_can_read?(current_user)
    current_user.id == self.user_id
  end
  
end
