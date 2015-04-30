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

require 'rails_helper'

RSpec.describe Application, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
