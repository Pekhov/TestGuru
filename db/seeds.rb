require 'faker'
5.times do
  User.create(name: Faker::Name.name)
end

categories = []
CATEGORY_NAME = ["Внедорожники", "Легковые", "Коммерческий транспорт"]
CATEGORY_NAME.each do |name|
  categories << Category.create(title: name)
end

Test.create(title: "Быстрый тест на принадлежность к внедорожному стилю езды", level: 0, category: categories[0])
Test.create(title: "Тест на знание отличительных особенностей внедорожников", level: 1, category: categories[0])

Question.create(body: "На загородной трассе вы встали в пробку. Выши действия?", test_id: 1)
Question.create(body: "Вас решили подвезти на дачу. Какую машину вы выберете?", test_id: 1)

Answer.create(body: "Буду стоять в пробке", correct: false, question_id: 1)
Answer.create(body: "Развернусь", correct: false, question_id: 1)
Answer.create(body: "Объеду по обочине", correct: true, question_id: 1)

Answer.create(body: "Mersedes S600", correct: false, question_id: 2)
Answer.create(body: "УАЗ Патриот", correct: true, question_id: 2)
Answer.create(body: "Lada Vesta", correct: false, question_id: 2)
UserTest.create(user_id: 1, test_id: 1, status: "in process")
