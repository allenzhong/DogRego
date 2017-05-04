require "rails_helper"

RSpec.describe DogMailer, type: :mailer do
	describe "send email" do
		before(:each) do
			@dog = FactoryGirl.create(:ownership_registration).dog
			@mail = DogMailer.ownership_registered(@dog).deliver_now
		end

		it "send email with right recipient and subject" do
			expect(@mail['X-SMTPAPI'].value).to have_content(@dog.user.email)
			expect(@mail.from).to eq(["no-reply@dogrego.com"])
			expect(@mail.body).to have_content(@dog.ownership_registration.duration.humanize.downcase)
		end
	end

end
