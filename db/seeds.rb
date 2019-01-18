# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

12.times do |last_month|
  30.times do |yesterday|
    HebrewDate.find_or_create_by(month: last_month + 1, day: yesterday + 1, is_adar_b: nil)
  end
end

30.times do |yesterday|
  HebrewDate.find_or_create_by(month: 6, day: yesterday+1, is_adar_b: false)
end

30.times do |yesterday|
  HebrewDate.find_or_create_by(month: 6, day: yesterday+1, is_adar_b: true)
end
