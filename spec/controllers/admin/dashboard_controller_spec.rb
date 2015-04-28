require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  describe "GET #index" do
    describe "for non authenticated admins" do
      it "should redirect" do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
    describe "for authenticated admins" do
      before :each do
        @admin = create(:admin)
        sign_in :admin, @admin
      end
      it "should be a success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
