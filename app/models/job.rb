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

class Job < ActiveRecord::Base
  belongs_to :business
  has_many :applications, :dependent => :destroy

  validates :business_id, presence: true

  after_create :generate_secret_id

private

  def generate_secret_id
    self.secret_id ||= loop do
      random_token = SecureRandom.hex(16)
      break random_token unless Job.where(secret_id: random_token).exists?
    end
    update_column :secret_id, self.secret_id
  end

end
