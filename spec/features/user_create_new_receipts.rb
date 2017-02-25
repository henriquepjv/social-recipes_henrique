require 'rails_helper'

feature 'Visitor create new receipts'
  scenario 'successfully' do
    receipt = Receipt.create(name: 'bolo', cookery: 'italiana',food_type: 'doce',
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    visit new_receipt_path

    fill_in 'Nome da receita', with: receipt.name
    fill_in 'Cozinha', with: receipt.cookery
    fill_in 'Tipo de comida', with: receipt.food_type
    fill_in 'Quantas pessoas serve', with: receipt.people_portion
    fill_in 'Tempo de preparo', with: receipt.preparation_time
    fill_in 'Nível de dificuldade', with: receipt.difficult
    fill_in 'Ingredientes', with: receipt.ingredients
    fill_in 'Passo a passo', with: receipt.steps

    click_on 'Cadastrar receita'

  end
end
