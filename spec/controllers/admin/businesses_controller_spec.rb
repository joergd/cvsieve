require 'rails_helper'

RSpec.describe Admin::BusinessesController, type: :controller do

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

    describe "PUT #suspend" do
      before :each do
        @business = create(:business)
        @business.update_attribute :status, Business::ACTIVE_STATUS
      end
      it "returns http redirect to index" do
        put :suspend, id: @business.to_param
        expect(response).to redirect_to(admin_businesses_path)
      end
      it "should suspend the business" do
        put :suspend, id: @business.to_param
        @business.reload
        expect(@business).to be_suspended
      end
    end

    describe "PUT #activate" do
      before :each do
        @business = create(:business)
        @business.update_attribute :status, Business::SUSPENDED_STATUS
      end
      it "returns http redirect to index" do
        put :activate, id: @business.to_param
        expect(response).to redirect_to(admin_businesses_path)
      end
      it "should activate the business" do
        put :activate, id: @business.to_param
        @business.reload
        expect(@business).to be_active
      end
    end

  end
end
