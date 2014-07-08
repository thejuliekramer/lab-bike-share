# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [
["walter", true],
["julie", true],
["frank", true]
]

user_list.each do |username, admin|
	User.create(username: username,
	admin: admin,
	password_digest: 'password')
end