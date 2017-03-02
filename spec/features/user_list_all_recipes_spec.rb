require 'rails_helper'

feature 'Visitor list all recipes' do
  scenario 'Successfully' do
    cookery = Cookery.create(name: 'Italiana')

    food = Food.create(name: 'entrada')

    recipe = Recipe.create(name: 'bolo', cookery: cookery, food: food,
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    otherRecipe = Recipe.create(name: 'biscoito', cookery: cookery, food: food,
                            people_portion: '10', preparation_time: '120 min',
                            difficult: 'médio', ingredients: 'farinha, fermento, sal',
                            steps: 'primeiro misture a farinha com o fermento')


    visit root_path

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food.name
    expect(page).to have_content recipe.cookery.name
    expect(page).to have_content recipe.difficult

    expect(page).to have_content otherRecipe.name
    expect(page).to have_content otherRecipe.food.name
    expect(page).to have_content otherRecipe.cookery.name
    expect(page).to have_content otherRecipe.difficult

  end
end
