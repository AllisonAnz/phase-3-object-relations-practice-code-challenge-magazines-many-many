class Subscription < ActiveRecord::Base
  belongs_to :magazine 
  belongs_to :reader

  # Subscription#print_details 
  # puts a string to the terminal to display the details of the subscripiton 
  # {reader name} subscribed to {magazine title} for ${subscription price}
  def print_details 
    puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
  end
end

#  Subscription.first
# sub = Subscription.first