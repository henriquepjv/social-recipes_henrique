require 'rails_helper'

feature 'User list his own recipes' do
  scenario 'Successfully' do
    cookery = create(:cookery)

    user = create(:user)

    food = create(:food)

    recipe = create(:recipe)

    otherRecipe = create(:recipe, name: 'bomba de chocolate')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(page).to have_content("Olá #{user.email}")

    expect(page).to have_content user.recipe.name
    expect(page).to have_content user.recipe.food.name
    expect(page).to have_content user.recipe.cookery.name
    expect(page).to have_content user.recipe.difficult

    expect(page).to have_content user.otherRecipe.name
    expect(page).to have_content user.otherRecipe.food.name
    expect(page).to have_content user.otherRecipe.cookery.name
    expect(page).to have_content user.otherRecipe.difficult
  end
end
