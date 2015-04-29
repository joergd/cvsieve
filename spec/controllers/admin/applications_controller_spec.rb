require 'rails_helper'

RSpec.describe Admin::ApplicationsController, type: :controller do

  describe "non admin people" do
    it "should redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "for admins" do
    before :each do
      @admin = create(:admin)
      sign_in :admin, @admin
    end
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
