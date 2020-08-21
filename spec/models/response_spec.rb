require 'rails_helper'

RSpec.describe Response, type: :model do
  describe 'associations' do
    it { should belong_to(:question) }
  end

  describe 'validations' do
    it { should validate_length_of(:response_text).is_at_most(1500) }
  end
end
