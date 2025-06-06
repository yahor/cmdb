require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relations and validations" do
    let(:user) { create :user }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_most(255) }
  end
end
