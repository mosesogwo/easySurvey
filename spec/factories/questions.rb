FactoryBot.define do
  factory :question do
    survey { nil }
    question_text { "MyString" }
    required { false }
    question_type { "MyString" }
  end
end
