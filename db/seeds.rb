# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# make categories
c1 = Category.new
c1.name = "Animals"
c1.save
c2 = Category.new
c2.name = "People"
c2.save
c3 = Category.new
c3.name = "Abstract"
c3.save
