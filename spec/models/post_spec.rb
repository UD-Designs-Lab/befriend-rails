require "rails_helper"

RSpec.describe Post, type: :model do
  describe "validations" do
    it { should validate_presence_of(:body) }

    it {
      should define_enum_for(:reply_status)
        .with_values(everyone: "everyone", people_you_know: "people_you_know")
        .backed_by_column_of_type(:string)
        .with_suffix(:can_reply)
    }

    it { should validate_length_of(:body).is_at_most(240) }
  end

  describe "associations" do
    it { should belong_to(:user) }

    it { should have_many(:comments) }

    it { should have_many(:favourites) }

    it { should have_many(:reposts) }
  end

  describe "before creating a new post it should set uuid" do
    it "is expected to set uuid with Secure Random hash" do
      post = build :post, uuid: nil
      post.save!
      expect(post.reload.uuid).to_not be_nil
    end
  end
end
