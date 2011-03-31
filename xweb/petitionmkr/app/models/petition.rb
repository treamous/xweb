class Petition < ActiveRecord::Base
  
  validates :title, :presence => true, :length => { :maximum => 25 }
  validates :description, :presence => true, :length => { :maximum => 1000 }
  validates :criteria, :presence => true, :length => { :maximum => 2 }
  validates :closedate, :presence => true

  scope :search, lambda {|query| where(["username LIKE ?", "%#{query}%"])}
  scope :searchsignup, lambda {|query| where(["username NOT LIKE ? AND (closedate > datetime('now', 'localtime'))", "%#{query}%"])}
end
