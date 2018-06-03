class RegisteredApp < ActiveRecord::Base
    belongs_to :user
    
   # app is unique by user
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true, :uniqueness => {:scope=>:user_id}
   validates :url, length: { minimum: 1, maximum: 100 }, presence: true, :uniqueness => {:scope=>:user_id}
end
