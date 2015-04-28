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

end
