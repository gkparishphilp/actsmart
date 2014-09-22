# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create name: 'Gk', email: 'gk@gk.com', password: '1234', role: 'admin'
amy = User.create name: 'Amy', email: 'amy@amy.com', password: '1234', role: 'admin'





a = Agency.create name: 'Test Agency', facilitator: amy
u = User.create name: 'joe', email: 'joe@joe.com', password: '1234'

a.agency_users.create user: u, role: 'lead'