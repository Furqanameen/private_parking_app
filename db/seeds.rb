# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# if there is no OAuth application created, create them
# Doorkeeper::Application.create(name: 'angular', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?

# Doorkeeper::Application.find_by(name: "angular").uid
# Doorkeeper::Application.find_by(name: "angular").secret
# id: 1,
# name: "angular",
# uid: "9Icq25PXPOgNYfptJuBF4AhV3P65SjaTD25eY2f3DlE",
# secret: "3TgIdvQCuJv66MwYf736Yt8p3Uwz4AC4ii5KQxoDuqQ",
# redirect_uri: "",
# scopes: "",
# confidential: true,



(1..10).each do |i|
	slot = Slot.last
	open_time = slot.open_time + 1.hour
	close_time = slot.close_time + 1.hour
	name = Faker::Name.name
	puts "Slote generated #{i*4}"
	Slot.create(name: name ,price: rand(500..1000), features: "car_type", slot_time: "morning", is_available: true, open_time: open_time, close_time: close_time)
	Slot.create(name: name,price: rand(500..1000), features: "disabled_people", slot_time: "evening", is_available: true, open_time: open_time, close_time: close_time)
	Slot.create(name: name,price: rand(500..1000), features: "disabled_people", slot_time: "evening", is_available: true, open_time: open_time, close_time: close_time)
	Slot.create(name: name,price: rand(500..1000), features: "has_shade", slot_time: "evening", is_available: true, open_time: open_time, close_time: close_time)
end