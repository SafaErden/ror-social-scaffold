require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20)}
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(20)}
    it { should validate_presence_of(:gravatar_url) }
    it { should validate_length_of(:gravatar_url).is_at_least(5)}
  end
  describe 'associations' do
    it{ should have_many(:posts)}
    it{ should have_many(:comments)}
    it{ should have_many(:likes)}
    it{ should have_many(:friendships)}
    it{ should have_many(:inverse_friendships).class_name('Friendship').with_foreign_key(:friend_id)}
  
  end
 
end