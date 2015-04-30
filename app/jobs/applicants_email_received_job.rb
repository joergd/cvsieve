class ApplicantsEmailReceivedJob
  include SuckerPunch::Job

  def perform(id)
    ApplicantMailer.received(id).deliver
  end
end
