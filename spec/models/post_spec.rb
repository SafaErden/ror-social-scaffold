require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_most(1000) }
  end

  describe 'associations' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
