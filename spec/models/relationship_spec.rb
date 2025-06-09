require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:ci_1) { create :configuration_item }
  let(:ci_2) { create :configuration_item }

  subject { build :relationship, configuration_item: ci_1, connected_item: ci_2 }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "raises circular dependencies not allowed error" do
      subject.connected_item = ci_1

      expect(subject).to_not be_valid
      expect(subject.errors[:base]).to include("circular dependencies not allowed when creating relationships.")
    end
  end
end
