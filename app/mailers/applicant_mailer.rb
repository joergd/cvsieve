class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.received.subject
  #
  def received(application_id)
    @application = Application.find(application_id)
    mail to: @application.business.email, subject: "[Applicant Labs] You have received an application from #{@application.name}"
  end
end
