namespace :db do
	desc "Fill database with samle data"
	task populate: :environment do
		admin = User.create!(name: "admin",
			email: "a@synchro.eu",
			club: "Poznan",
			password: "foobar",
			password_confirmation: "foobar",
			admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@synchro.eu"
			club = "Poznan"
			password = "password"
			User.create!(name: name,
				email: email,
				club: club,
				password: password,
				password_confirmation: password)
		end
		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end
end
