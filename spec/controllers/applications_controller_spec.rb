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

  describe "job applications" do
    before :each do
      @business = create(:business)
      @job = @business.job
    end
    describe "applying" do
      it "should be a success for new applications" do
        get :new, id: @job.to_param
        expect(response).to have_http_status(:success)
      end
    end

    describe "thankyou" do
      it "should be a success" do
        get :thankyou, id: @job.to_param
        expect(response).to have_http_status(:success)
      end
    end

    describe "sending" do
      describe "for invalid applications" do
        it "should display new template" do
          post :create, id: @job.to_param, application: { name: "Jonny", tel: "1332234", email: "jonny@spam.com", answer: "haha", video: "" }
          expect(response).to render_template(:new)
        end
      end
      it "should be a redirect to thankyou" do
        post :create, id: @job.to_param, application: { name: "Jonny", tel: "1332234", email: "jonny@spam.com", answer: "haha", video: "123" }
        expect(response).to redirect_to(thankyou_path(@job))
      end
    end
  end

  describe "viewing an application" do
    before :each do
      @application = create(:application)
    end
    describe "not a business" do
      it "should redirect" do
        get :show, id: @application.to_param
        expect(response).to have_http_status(:redirect)
      end
    end
    describe "a logged in business" do
      before :each do
        sign_in :business, @application.job.business
      end
      it "should be a success" do
        get :show, id: @application.to_param
        expect(response).to have_http_status(:success)
      end
    end
  end

end


