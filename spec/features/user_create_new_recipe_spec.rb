require 'rails_helper'

feature 'Visitor create new recipe' do
  scenario 'successfully' do
    cookery = Cookery.create(name: 'Italiana')

    food = Food.create(name: 'entrada')

    recipe = Recipe.new(name: 'bolo', cookery: cookery, food: food,
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

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
