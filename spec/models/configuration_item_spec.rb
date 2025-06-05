require 'rails_helper'

RSpec.describe ConfigurationItem, type: :model do
  subject do
    described_class.new(
      name: "Database Server",
      type: "Server",
      status: "Active",
      environment: "Production"
    )
  end

  describe "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an type" do
      subject.type = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:type]).to include("can't be blank")
    end

    it "is invalid without a status" do
      subject.status = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:status]).to include("can't be blank")
    end

    it "is invalid with an unknown status" do
      subject.status = "Broken"
      expect(subject).not_to be_valid
      expect(subject.errors[:status]).to include("is not included in the list")
    end

    it "is invalid without an environment" do
      subject.environment = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:environment]).to include("can't be blank")
    end

    it "is invalid with an unknown environment" do
      subject.environment = "QA"
      expect(subject).not_to be_valid
      expect(subject.errors[:environment]).to include("is not included in the list")
    end
  end
end
