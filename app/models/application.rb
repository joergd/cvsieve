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
end
