class Event < ActiveRecord::Base
  has_many :attendances
  has_many :users, through: :attendances
  has_many :messages
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  

  def not_past
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past.")
    end
  end
end
