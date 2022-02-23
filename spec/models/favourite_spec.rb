require 'rails_helper'

RSpec.describe Favourite, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }

    it { should belong_to(:favouriteable) }
  end
end
