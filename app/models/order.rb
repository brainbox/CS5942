class Order < ActiveRecord::Base

def self.total_on(date)
  where("date(date) = ?", date).sum(:amount)
end

end
