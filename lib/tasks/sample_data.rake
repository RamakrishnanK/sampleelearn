namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "admin123",
			email: "admin123@admin.com",
			password: "12345678",
			password_confirmation: "12345678",
			 admin: "1" )

		admin.toggle!(:admin)
		end
	end