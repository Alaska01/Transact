require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:log_groups) }
    it { should have_many(:logs).through(:log_groups) }
    it { should have_many(:logs).through(:log_groups) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
  end
end
