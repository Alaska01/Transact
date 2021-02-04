require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:logs).with_foreign_key(:author_id) }
    it { should have_many(:groups) }
    it { should_not belong_to(:log_groups) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_presence_of(:email) }
  end
end
