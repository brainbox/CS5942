module LanguagesHelper
  
  def letter_series(letters, date)
    letters_by_day = letters.find(:all, 
                                :conditions => {:created_at => date..Date.today},
                                :group => 'date(created_at)',
                                :select => 'date(created_at) as day, count(id) as counter'
                                ) #.map{|c| c['counter']}.inspect
    (date..Date.today).map do |day|
      letter = letters_by_day.detect { |c| c['day'] == day.to_s } # Careless comparison!
      (letter && letter['counter']) || 0
    end.inspect     
  end
  
end
