# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Translation.delete_all
Problem.delete_all

for i in 1..103 do
  translation = Translation.create(
             problem_id: i,
             title: "Problem Nummer #{i}",
             content: "Das hier ist der Inhalt von <b>Problem #{i}</b>.<br />Hier ist die zweite Zeile."
  )
  Problem.create(id: i, translation: translation)
end
