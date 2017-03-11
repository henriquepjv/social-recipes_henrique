require 'rails_helper'

feature 'Visitor create new recipe' do
  scenario 'successfully' do

    cookery = create(:cookery)

    food = create(:food) 

    recipe = build(:recipe, cookery: cookery, food: food)

    visit new_recipe_path

    fill_in 'Nome da receita', with: recipe.name
    select cookery.name, from: 'Cozinha'
    select food.name, from: 'Tipo de comida'
    fill_in 'Quantas pessoas serve', with: recipe.people_portion
    fill_in 'Tempo de preparo', with: recipe.preparation_time
    fill_in 'Nível de dificuldade', with: recipe.difficult
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Passo a passo', with: recipe.steps

    click_on 'Cadastrar receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.cookery.name
    expect(page).to have_content recipe.food.name
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
