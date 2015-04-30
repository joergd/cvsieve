class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.received.subject
  #
  def received(application_secret_id)
    @application = Application.find_by_secret_id!(application_secret_id)
    mail to: @application.business.email, subject: "[Applicant Labs] You have received an application from #{@application.name}"
  end

end
