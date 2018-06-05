# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create  2 confirmed users

require 'faker'
require 'random_events'

ricky = User.create!( email: "ricky@example.com", password: "abcdef")
ricky.confirmed_at = Time.now
ricky.save!

bobby = User.create!( email: "bobby@example.com", password: "abcdef")
bobby.confirmed_at = Time.now
bobby.save!

users = User.all

# Create 10 Registered Apps, randomly assigned to users
10.times do
  RegisteredApp.create!(name: Faker::SiliconValley.company, url: Faker::Internet.url, user: users.sample)
end

registered_apps = RegisteredApp.all

#Create 100 Events, randomly assigned to registered apps
100.times do
  Event.create!(name: RandomEvents.random_event, registered_app: registered_apps.sample)
end


