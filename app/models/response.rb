class Response < ApplicationRecord
  belongs_to :question

  validates :response_text, length: { maximum: 1500 }, allow_blank: true


  private

  # def check_response_number
  #   if question == 'scale'
  #     errors.add('Response must be in range of 1 - 4') if !1..4.include?(response_number)
  #   elsif question == 'binary'
  #     errors.add('Response must be 0 or 1') if !0..1.include?(response)
  #   end
  # end
end
