require 'rails_helper'

RSpec.describe LogGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:log) }
    it { should belong_to(:group) }
  end
end
