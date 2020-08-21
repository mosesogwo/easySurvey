class Survey < ApplicationRecord
  belongs_to :admin
  
  validates :title, :end_date, presence: true
  validates :title, length: { minimum: 10, maximum: 200 }

end
