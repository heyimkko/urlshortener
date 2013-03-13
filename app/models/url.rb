class Url < ActiveRecord::Base

  before_save :create_short_url
  validates :long_url, :presence => true
  validates :long_url, :format => { :with => (/http:\/\/www.\S*\.\S*/) }
  
  def increment_clicks
    self.click_count += 1 #when we click
  end

  private

  def create_short_url
    p "%" * 100
    p self.short_url
    self.short_url = SecureRandom.hex[0..5] if self.short_url.nil?
  end

  
end
