require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:survey) }
    it { should have_many(:responses) }
  end

  describe 'validations' do
    it { should validate_presence_of(:question_text) }
    it { should validate_presence_of(:required) }
    it { should validate_length_of(:question_text).is_at_most(1000)}
    it { should validate_inclusion_of(:question_type).in_array(['scale', 'binary', 'descriptive'])}
  end
end
