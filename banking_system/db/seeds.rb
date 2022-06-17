# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(first_name: "Aksha", last_name: "bajaj", email: "abajaj@mailinator.com", gender: "male", role: "admin",pan_no: "BK123456", aadhar_no: "221122335566", mobile_number: "1234567890", password: "123456789", password_confirmation: "123456789")
