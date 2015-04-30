require "rails_helper"

RSpec.describe ApplicantMailer, type: :mailer do
  describe "received" do
    before :each do
      @application = create(:application, name: "Johnny")
    end

    let(:mail) { ApplicantMailer.received(@application.to_param) }

    it "renders the headers" do
      expect(mail.subject).to eq("[Applicant Labs] You have received an application from Johnny")
      expect(mail.to).to eq([@application.business.email])
      expect(mail.from).to eq(["no-reply@applicantlabs.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Johnny")
    end
  end

end
