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
#  secret_id              :string
#

class Business < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true

  has_one :job, :dependent => :destroy
  has_many :applications, through: :job

  after_create :create_job

  STATUSES = %w(active deleted suspended)
  ACTIVE_STATUSES = %w(active)
  DELETED_STATUS = 'deleted'
  SUSPENDED_STATUS = 'suspended'
  ACTIVE_STATUS = 'active'

  scope :published, -> { where(status: ACTIVE_STATUSES) }

  def suspended?
    status == SUSPENDED_STATUS
  end

  def active?
    ACTIVE_STATUSES.include?(status)
  end

private


end
