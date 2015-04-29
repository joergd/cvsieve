require 'rails_helper'

RSpec.describe Business, type: :model do

  describe "creating a business" do
    it "should create a job" do
      business = create(:business)
      expect(business.job).not_to be_nil
    end
  end

  describe "destroying a business" do
    before :each do
      @business = create(:business)
      @job = @business.job
      @application = @job.applications.create
    end
    it "should destroy the jobs" do
      @business.destroy
      expect(Job.find_by_id(@job.id)).to be_nil
    end
    it "should destroy the applications" do
      @business.destroy
      expect(Application.find_by_id(@application.id)).to be_nil
    end
  end
end
