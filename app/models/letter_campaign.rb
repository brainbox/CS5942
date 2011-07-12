class LetterCampaign < ActiveRecord::Base
  
  has_many :letters
def self.total_on(date)
    #where("date(created_at) = ?", date).count
    find(:all,:conditions => ["date(created_at) = ?", date]).count
  end
  
end
