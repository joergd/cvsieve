require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:business]
  end
  describe "GET #edit" do
    describe "for non authenticated businesses" do
      it "should redirect" do
        get :edit
        expect(response).to have_http_status(:redirect)
      end
    end
    describe "for authenticated businesses" do
      before :each do
        @business = create(:business)
        sign_in :business, @business
      end
      it "should be a success" do
        get :edit
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    it "should be a redirect" do
      post :create, business: { name: "KFC", email: "kfc@spam.com", contact: "Jon", tel: "122434", password: "password", password_confirmation: "password"}
      expect(response).to have_http_status(:redirect)
    end
    it "should create a business" do
      post :create, business: { name: "KFC", email: "kfc@spam.com", contact: "Jon", tel: "122434", password: "password", password_confirmation: "password"}
      @business = Business.last
      expect(@business.name).to eq("KFC")
      expect(@business.email).to eq("kfc@spam.com")
      expect(@business.contact).to eq("Jon")
      expect(@business.tel).to eq("122434")
    end
  end

end
