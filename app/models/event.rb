class Event < ActiveRecord::Base
  belongs_to :registered_app
  
  validates :name, presence: true
end
