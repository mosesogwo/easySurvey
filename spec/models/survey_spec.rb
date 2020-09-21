require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'associations' do
    it { should belong_to(:admin) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:end_date) }
    it { should validate_length_of(:title).is_at_least(10).is_at_most(200) }
  end
end
