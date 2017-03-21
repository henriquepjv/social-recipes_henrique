require 'rails_helper'

feature 'user choose one food and see all related recipes' do
  scenario 'Successfully' do
    user = create(:user, email: 'xpto@blabla', name: 'José' )

    cookery = create(:cookery, name: 'Italiana')

    food = create(:food, name: 'entrada')

    otherFood = create(:food, name: 'sobremesa')

    recipe = create(:recipe, name: 'batata frita', cookery: cookery, user: user, food: food)

    otherRecipe = create(:recipe, name: 'brigadeiro', cookery: cookery, user: user, food: otherFood)

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    click_on food.name

    expect(page).to have_content recipe.food.name
    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.cookery.name
    expect(page).not_to have_content otherRecipe.name

  end
end
