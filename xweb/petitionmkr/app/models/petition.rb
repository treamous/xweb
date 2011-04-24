class Petition < ActiveRecord::Base
  
  has_and_belongs_to_many :users
  
  # Validations
  validates :title, :presence => true, :length => { :maximum => 25 }
  validates :description, :presence => true, :length => { :maximum => 1000 }
  validates :criteria, :presence => true, :length => { :maximum => 2 }
  validates :closedate, :presence => true
  
  # DB serches for views{i.e portfolio}
  scope :search, lambda {|query| where(["username LIKE ?", "%#{query}%"])}
  scope :searchsignup, lambda {|query| where(["username NOT LIKE ? AND (closedate > datetime('now', 'localtime'))", "%#{query}%"])}
end
