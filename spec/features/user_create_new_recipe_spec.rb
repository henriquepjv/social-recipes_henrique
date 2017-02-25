require 'rails_helper'

feature 'Visitor create new recipe' do
  scenario 'successfully' do
    recipe = Recipe.new(name: 'bolo', cookery: 'italiana',food_type: 'doce',
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    visit new_recipe_path

    fill_in 'Nome da receita', with: recipe.name
    fill_in 'Cozinha', with: recipe.cookery
    fill_in 'Tipo de comida', with: recipe.food_type
    fill_in 'Quantas pessoas serve', with: recipe.people_portion
    fill_in 'Tempo de preparo', with: recipe.preparation_time
    fill_in 'Nível de dificuldade', with: recipe.difficult
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Passo a passo', with: recipe.steps

    click_on 'Cadastrar receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.cookery
    expect(page).to have_content recipe.food_type
    expect(page).to have_content recipe.people_portion
    expect(page).to have_content recipe.preparation_time
    expect(page).to have_content recipe.difficult
    expect(page).to have_content recipe.steps
  end

  scenario 'With invalid data' do

    visit new_recipe_path

    click_on 'Cadastrar receita'

    expect(page).to have_content 'Dado inválido'

  end

end
