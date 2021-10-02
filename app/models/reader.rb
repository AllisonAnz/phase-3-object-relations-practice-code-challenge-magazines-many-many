class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  # Reader#subscribe(magazine, price)
  # takes a magazine (an instance of the Magazine class) and price (integer) as arguments 
  # and creates a new subscription in the database associated with the magazine and the reader 
  def subscribe(magazine, price)
    Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
  end

  # Reader#total_subscription_price 
  # returns total price for all the reader's subscriptions 
  def total_subscription_price
    sum = 0
    self.subscriptions.each do |subscription|
        sum += subscription.price 
    end
    sum
  end

  # Reader#cancel_subscription(magazine)
  # takes a magazine instance and removes the subscription for this reader 
  # you will have to delete a row from the subscription table for this to work 
  def cancel_subscription(magazine)
    self.subscriptions.find {|subscription| subscription.magazine  === magazine}.delete
  end
end