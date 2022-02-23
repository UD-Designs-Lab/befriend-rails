require 'rails_helper'

RSpec.describe Repost, type: :model do
  describe 'validations' do
    it { should validate_length_of(:body).is_at_most(240) }
  end

  describe 'associations' do
    it { should belong_to(:user) }

    it { should belong_to(:repostable) }

    it { should have_many(:reposts) }

    it { should have_many(:favourites) }

    it { should have_many(:comments) }
  end

  describe "before reposting it should set uuid" do
    it "is expected to set uuid with Secure Random hash" do
      repost = build :repost, uuid: nil
      repost.save!
      expect(repost.reload.uuid).to_not be_nil
    end
  end
end
