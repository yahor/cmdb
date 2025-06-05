require 'rails_helper'

RSpec.describe ConfigurationItemsController, type: :controller do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:user) { FactoryBot.create(:user) }
  let(:ci) { FactoryBot.create(:configuration_item) }

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'Logged in user' do
    before do
      sign_in user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET 'show'" do
      it "returns http success" do
        process :show, params: { id: ci.id }
        expect(response).to be_successful
      end
    end
    describe "GET 'new'" do
      it "returns http success" do
        expect {
          process :new
        }.to raise_error(CanCan::AccessDenied)
      end
    end
  end

  context 'Logged in admin user' do
    before do
      sign_in admin_user
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET 'show'" do
      it "returns http success" do
        process :show, params: { id: ci.id }
        expect(response).to be_successful
      end
    end

    describe "GET 'new'" do
      it "returns http success" do
        process :new
        expect(response).to be_successful
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        process :edit, params: { id: ci.id }
        expect(response).to be_successful
      end
    end
  end
end
