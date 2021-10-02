class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  # Magazine#email_list 
  # return a string of a semi-colon separated list of emails from all the readers subscribed to this magazine 
  # email1@example.com;email2@example.com;email3@example.com
  def email_list 
    self.readers.map do |reader|
        "#{reader.email}; "
    end
  end

  # Magazine.most_populate 
  # returns the Magazine instance with the most subscriptions 
  def self.most_popular 
    self.all.max_by {|magazine| magazine.subscriptions.length}
  end
end