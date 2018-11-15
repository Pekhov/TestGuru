require 'faker'
users = []
5.times do
  users << User.create(name: Faker::Name.name)
end

categories = []
["Внедорожники", "Легковые", "Коммерческий транспорт"].each do |name|
  categories << Category.create(title: name)
end
tests = []
tests << Test.create(title: "Быстрый тест на принадлежность к внедорожному стилю езды", level: 0, category: categories[0])
tests << Test.create(title: "Тест на знание отличительных особенностей внедорожников", level: 1, category: categories[0])
tests.first.users.push(users.first)

questions = []
questions << Question.create(body: "На загородной трассе вы встали в пробку. Выши действия?", test: tests.first)
questions << Question.create(body: "Вас решили подвезти на дачу. Какую машину вы выберете?", test: tests.first)

Answer.create(body: "Буду стоять в пробке", correct: false, question: questions.first)
Answer.create(body: "Развернусь", correct: false, question: questions.first)
Answer.create(body: "Объеду по обочине", correct: true, question: questions.first)

Answer.create(body: "Mersedes S600", correct: false, question: questions.second)
Answer.create(body: "УАЗ Патриот", correct: true, question: questions.second)
Answer.create(body: "Lada Vesta", correct: false, question: questions.second)
