class Vacant < ApplicationRecord
  belongs_to :user
  has_many :postulations

  
end
