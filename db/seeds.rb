# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Translation.delete_all
Problem.delete_all
User.delete_all


for i in 1..20 do
  Problem.create!(id: i)
end

for i in 1..10 do
  translation = Translation.create!(
   problem: Problem.find(i),
   title: "Problem Nummer #{i}",
   content: %Q(<p>Das hier ist der Inhalt von <b>Problem #{i}</b>.
<br />Hier ist die zweite Zeile.</p>
<p>Es können auch Formeln im Text (z.B. $1+2=3$) oder als eigene Zeile genutzt werden.</p>
\\[ a^2 + b^2 = c^2 \\])
  )

  problem = Problem.find(i)
  problem.set_translation(translation)
end


User.create!(
  provider: :developer,
  uid: "admin",
  name: "admin",
  role: 1
)

User.create!(
  provider: :developer,
  uid: "translator",
  name: "translator"
)

p "Created #{Problem.count} problems"
p "Created #{Translation.count} translations"
p "Created #{User.count} users"
