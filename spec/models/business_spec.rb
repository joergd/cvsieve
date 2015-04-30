# == Schema Information
#
# Table name: businesses
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  contact                :string
#  tel                    :string
#  status                 :string           default("active")
#

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
