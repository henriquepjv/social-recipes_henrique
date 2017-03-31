# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cookery.destroy_all
Food.destroy_all
Recipe.destroy_all
User.destroy_all

user = User.create(email: 'maria@hotmail.com', password: '123456')

other_user = User.create(email: 'henriquepjv@hotmail.com', password: '123456')

cookery = Cookery.create(name: 'italiana')

other_cookery = Cookery.create(name: 'alemã')

food = Food.create(name: 'entrada')

other_food = Food.create(name: 'sobremesa')

Recipe.create([{name: 'bolo', cookery: cookery, food: food, user: user, picture_file_name: 'hrq.jpg',
                  people_portion: '6 pessoas', preparation_time: '60 min', difficult: 'média',
                  ingredients: 'ovo, banana, farinha', steps: 'junte tudo e bata no liquidificador'},
                {name: 'pizza', cookery: other_cookery, food: food, user: other_user, picture_file_name: 'hrq.jpg',
                  people_portion: '4 pessoas', preparation_time: '60 min', difficult: 'média',
                  ingredients: 'ovo, banana, farinha', steps: 'junte tudo e bata no liquidificador'}])
