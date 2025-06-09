require 'rails_helper'

RSpec.describe ConfigurationItem, type: :model do
  let(:ci) { create :configuration_item }
  let(:ci_2) { create :configuration_item }

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

    describe "relationships" do
      context 'destroy CI with relations and without' do
        before do
          ci_2.relationships.create(connected_item: ci, using_type: 'runs')
        end

        context 'destroy CI with relation as connected item' do
          it "retuns errors" do
            expect(ci.destroy).to be_falsey
            expect(ci.errors[:base]).to include("it is used in other CI relations")
          end

          it 'does not destroy ci' do
            expect { ci.destroy }.to_not change { ConfigurationItem.count }
          end
        end

        context 'destroy CI without connected relations' do
          it "destroys record" do
            expect { ci_2.destroy }.to change { ConfigurationItem.count }.by(-1)
            expect(ci_2.errors[:base]).to eq([])
          end
        end
      end
    end
  end
end
