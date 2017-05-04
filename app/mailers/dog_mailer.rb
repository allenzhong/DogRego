class DogMailer < ApplicationMailer
	def ownership_registered(dog)
		category 'DogRego'
		@dog = dog
		@user = dog.user
		mail(to: @user.email, subject: "#{dog.name} has been registered ownership for #{dog.ownership_registration.duration.humanize.downcase}")
	end
end
