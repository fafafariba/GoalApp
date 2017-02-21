class Goal < ActiveRecord::Base
  validates :name, :description, :visibility, :status, :user, presence: true
  
  belongs_to :user
end
