require 'rails_helper'

feature 'User choose one cookery and see all related recipes' do
  scenario 'Successfully' do
    cookery = Cookery.create(name: 'Italiana')

    food = Food.create(name: 'entrada')

    recipe = Recipe.create(name: 'bolo', cookery: cookery, food: food,
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    recipe2 = Recipe.create(name: 'bolo', cookery: cookery, food: food,
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    recipe3 = Recipe.create(name: 'bolo', cookery: cookery, food: food,
                            people_portion: '6', preparation_time: '60 min',
                            difficult: 'médio', ingredients: 'fermento, doce de leite',
                            steps: 'primeiro quebre os ovos')

    visit root_path

    click_on cookery.name

    expect(page).to have_content recipe.cookery.name

  end
end
