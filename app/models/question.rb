class Question < ApplicationRecord
  belongs_to :survey
  has_many :responses

  validates :question_text, length: { maximum: 1000 }
  validates :question_type, inclusion: { in: %w(short_text number scale binary descriptive) }
  validates :question_no, presence: true, numericality: true, uniqueness: { scope: :survey, message: 'Question number is already taken' }
end
