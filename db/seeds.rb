# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
q_cats = QuestionCategory.create [{title: 'О таможне'}, {title: 'О грузах'},
                                {title: 'О документах'}, {title: 'О сроках'},
                                {title: 'О цене'}]

q_cats.each do |cat|
  Question.create [{title: 'Какие документы требуются на таможне?',
                     body: 'Первыми книгами Гуттенберга были календари и грамматика Доната (всего он выпустил 13 таких изданий). Но в 1455 году он отважился на более сложное дело - выпустил первую печатную Библию общим объемом в 1286 страниц (3400000 печатных знаков). В этом издании типографской краской был набран только основной текст. Заглавные буквы и рисунки рисовал от руки художник. Открытый Гутенбергом способ книгопечатания оставался фактически неизменным до конца XVIII века. Редко какое открытие бывало так кстати, как изобретение печатного станка. Насколько книгопечатание отвечало насущным потребностям человечества, показали уже первые годы после раскрытия тайны Гутенберга. Сотни типографий, одна за другой, возникли в разных городах Европы. К 1500 году было выпущено по всей Европе до 30 тысяч различных названий книг.',
                   question_category: cat},
                   {title: 'Сколько времени занимает прохождение таможни?',
                     body: "Печатание текстов происходило следующим образом. Сначала наборщик набирал текст из свинцовых литер. Строками, как уже говорилось, служили специальные линейки - верстатки. Они представляли собой продолговатую коробочку, открытую сверху и с одного бока. Когда набирался один ряд нужной длины, наборщик выравнивал строку с помощью заключки - уменьшал или увеличивал пробелы между словами вынимая или вставляя шпации - тонкие кусочки словолитного металла без литер, имевшие определенную ширину. После заполнения верстатки ее устанавливали на наборную доску. Когда набор страницы заканчивался, доску брали в рамку, чтобы литеры не рассыпались.",
                   question_category: cat}]
end

p_cats = TopCategory.create [{title: 'Одежда'}, {title: 'Текстиль для дома'}]
p_cats.each do |cat|
  subcats = SubCategory.create [{title: 'Женская', top_category: cat},
                                     {title: 'Мужская', top_category: cat}]

  subcats.each do |subcat|
    Product.create [{title: 'Чехол для объектива', description: 'Чехол для объектива', sub_category: subcat},
                    {title: 'Сумка для фототехники', title: 'Сумка для фототехники', sub_category: subcat}]
  end
end
