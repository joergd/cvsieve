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
#  secret_id  :string
#

class Application < ActiveRecord::Base

  belongs_to :job

  validates :job_id, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :name, presence: true
  validates :tel, presence: true, format: { with: /[^A-Za-z]/ }
  validates :answer, presence: true
  validates :video, presence: true

  delegate :business, to: :job

  scope :order_by_business_name, -> { joins("INNER JOIN jobs ON jobs.id = applications.job_id INNER JOIN businesses ON businesses.id = jobs.business_id").order("businesses.name ASC") }

  after_create :generate_secret_id

  def to_param
    self.secret_id
  end

private

  def generate_secret_id
    self.secret_id ||= loop do
      random_token = SecureRandom.hex(16)
      break random_token unless Job.where(secret_id: random_token).exists?
    end
    update_column :secret_id, self.secret_id
  end


end
