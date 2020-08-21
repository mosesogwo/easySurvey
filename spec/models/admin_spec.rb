require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }
  describe 'Associations' do
    it { should have_many :surveys }
  end

  describe 'Validations' do

  end
end
