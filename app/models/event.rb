class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  
  validates :desc, :city, presence: true
 
  
end
