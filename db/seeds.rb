# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Translation.delete_all
Problem.delete_all
Admin.delete_all

for i in 1..10 do
  translation = Translation.create(
             problem_id: i,
             title: "Problem Nummer #{i}",
             content: "Das hier ist der Inhalt von <b>Problem #{i}</b>.<br />Hier ist die zweite Zeile."
  )
  Problem.create(id: i, translation_id: translation.id)
end

Problem.create(id: 11)

Admin.create(
         email: 'admin@example.com',
         password: 'password',
         password_confirmation: 'password'
)