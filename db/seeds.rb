# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


  Course.create(title: "Основная информация о виртуальных машинах", description: "description", volume: "16 час. 4 модуля", price: "7500", active: true)
  Course.create(title: "Стратегическое управление в образовании: методология и   кейсы проектных решений", description: "description", volume: "24 час. 6 модулей", price: "0", active: true)

  
  Unit.create(title: "unit1", body: "body1", course_ids: "1", active: true)