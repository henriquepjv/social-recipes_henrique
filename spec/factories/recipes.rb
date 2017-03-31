FactoryGirl.define do
  factory :recipe do
    name 'bolo'
    cookery
    food
    user
    picture_file_name 'hrq.jpg'
    people_portion '6'
    preparation_time '60 min'
    difficult 'médio'
    ingredients 'fermento, doce de leite'
    steps 'primeiro quebre os ovos'
  end
end
