# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# make categories
c1 = Category.new
c1.name = "Painting"
c1.save
c2 = Category.new
c2.name = "Drawing"
c2.save
c4 = Category.new
c4.name = "Architecture"
c4.save
c5 = Category.new
c5.name = "Design"
c5.save
c6 = Category.new
c6.name = "Mixed-Media"
c6.save
