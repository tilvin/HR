# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

skills = [ 'уметь работать в команде', 'знать моряцкие песени', 'делать грозный вид', 'знать марки рома',
           'быть стрессоустойчивым', 'не бояться морской болезни', 'вкусно приготовить чайку', 'знать нотную грамоту',
           'знать права потребителя', 'быть доброжелательным', 'любить детей', 'знать куда плыть', 'иметь световой меч',
           'вкусно приготовить что угодно']

skills.each do |name|
  skill = Skill.create(name: name)
end

contact = 'РФ, г. Город, ул. Ленина д. 10, company_email@mail.ru'
vacancies = [
             ['пират', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [1, 2, 3, 4, 6]), contact ],
             ['лоцман', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample,  Skill.where(id: [1, 2, 3, 6, 12]), contact ],
             ['кок', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [1, 2, 6, 7]), contact ],
             ['бармен', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [4, 10]), contact ],
             ['охранник', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [3, 5]), contact ],
             ['джедай',  Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [3, 5, 13]), contact ],
             ['менеджер по продажам',  Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [5, 9]), contact ],
             ['юрист',  Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [5, 9]), contact ],
             ['диджей',  Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [8, 10]), contact ],
             ['повар', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [7, 14]), contact ],
             ['учитель пения', Date.today.days_since(rand(0..5)), (100..1000).to_a.sample, Skill.where(id: [11, 8, 3]), contact ] ]

vacancies.each do |name, date_until, salary, skills, contact|
  vacancy = Vacancy.create( name: name, date_until: date_until, salary: salary, skills: skills, contact: contact)
end


users = [
        ['Соискатель Без Имени', (100..1000).to_a.sample, Skill.where(id: [1, 5, 9]), rand(2**30..2**33) ],
        ['Оби Ван Киноби', (100..1000).to_a.sample, Skill.where(id: [3, 5, 13]), rand(2**30..2**33) ],
        ['Иван Иванович Пармезан', (100..1000).to_a.sample, Skill.where(id: [7, 14]), rand(2**30..2**33)],
        ['Армин Ван Бюрен', (100..1000).to_a.sample, Skill.where(id: [8, 10]), rand(2**30..2**33) ],
        ['Лаврентий Лаврентиевич Лавр',(100..1000).to_a.sample, Skill.where(id: [11, 8, 3]), 'example@example.com'],
        ['Капитан Джек Воробей', (100..1000).to_a.sample, Skill.where(id: [1, 2, 3, 4, 6, 12]), 'example@example12.com'],
        ['Александр Родионович Бородач', (100..1000).to_a.sample, Skill.where(id: [3, 5]), 'example_2@example.com'] ]

users.each do |name, salary, skills, contact|
  user = User.create( name: name, salary: salary, skills: skills, contact: contact)
end