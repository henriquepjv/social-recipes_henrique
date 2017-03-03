require 'rails_helper'

feature 'Administrator creates new type of food' do
  scenario 'Successfully' do

    user = User.new(name: 'Henrique', email: 'henriquepjv@hotmail.com',
                    encrypted_password: '123456', administrator: true)

    food = Food.new(name: 'Italiana')

    visit new_food_path

    fill_in 'Digite o nome do tipo de comida', with: food.name

    click_on 'Cadastrar o tipo de comida'

    expect(page).to have_content food.name

  end

  scenario 'invalid data' do

    visit new_food_path

    click_on 'Cadastrar o tipo de comida'

    expect(page).to have_content 'Dado inválido'

  end

end
