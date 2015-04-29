# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  email      :string
#  name       :string
#  tel        :string
#  answer     :text
#  video      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Application < ActiveRecord::Base

  belongs_to :job
  # belongs_to :business, through: :job

  scope :order_by_business_name, -> { joins("INNER JOIN jobs ON jobs.id = applications.job_id INNER JOIN businesses ON businesses.id = jobs.business_id").order("businesses.name ASC") }

end
