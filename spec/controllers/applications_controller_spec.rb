require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do

  describe "non business" do
    it "should redirect" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
  describe "for businesses" do
    before :each do
      @business = create(:business)
      sign_in :business, @business
    end
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end
