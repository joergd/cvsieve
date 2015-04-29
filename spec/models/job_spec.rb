# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  business_id :integer
#  secret_id   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "creating a job" do
    it "should create a secreet id" do
      job = create(:job)
      expect(job.secret_id).not_to be_nil
    end
  end
end
