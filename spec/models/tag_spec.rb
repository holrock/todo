require 'rails_helper'

RSpec.describe Tag, type: :model do

  context "valid parameter" do
    it "valid" do
      expect(Fg.build(:tag)).to be_valid
    end
  end

  context "invalid parameter" do
    it "invalid" do
      expect(Fg.build(:tag, text:nil)).not_to be_valid
    end
  end

  context "duplicate tag" do
    it "invalid" do
      Fg.create(:tag, text:"tag")
      tag = Fg.build(:tag, text:"tag")
      tag.valid?
      expect(tag.errors[:text]).to include("has already been taken")
    end
  end

end
