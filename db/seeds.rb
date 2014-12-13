# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for i in 1..103 do
  Translation.create(
             title: "Problem Nummer #{i}",
             content: "Das hier ist der Inhalt von <b>Problem #{i}</b>.<br />Hier ist die zweite Zeile."
  )
end