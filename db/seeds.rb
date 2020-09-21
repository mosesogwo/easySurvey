# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Response.destroy_all
Question.destroy_all
Survey.destroy_all
Admin.destroy_all
# Create Admin
Admin.create(
  email: 'admin@gmail.com',
  password: 'password'
)

# Create surveys
5.times do
  Survey.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    admin_id: 1,
    end_date: Date.today + 2.years
  )
end

# Add questions to surveys
q_types = %w(short_text number scale binary descriptive)
5.times do |survey_id|
  5.times do |q_no|
    Question.create!(
      survey_id: survey_id + 1,
      question_no: q_no + 1,
      question_text: Faker::Lorem.question(word_count: 10),
      required: true,
      question_type: q_types[q_no]
    )
  end
end

# Add responses to questions (First 5)
scale = %i(0 1 2 3)
numbers = %i( 20, 30, 40)
binary = %w(agree disagree)

60.times do
  Response.create!(
    question_id: 1,
    response_text: Faker::Lorem.sentence(word_count: 2)
  )

  Response.create!(
    question_id: 2,
    response_text: numbers.sample
  )

  Response.create!(
    question_id: 3,
    response_text: scale.sample
  )

  Response.create!(
    question_id: 4,
    response_text: binary.sample
  )

  Response.create!(
    question_id: 5,
    response_text: Faker::Lorem.paragraph(sentence_count: 6)
  )
end