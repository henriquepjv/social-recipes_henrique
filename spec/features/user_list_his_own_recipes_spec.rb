require 'rails_helper'

feature 'User list his own recipes' do
  scenario 'Successfully' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user, food: food)

    otherRecipe = create(:recipe, name: 'bomba de chocolate', user: user)

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    click_on 'Minhas Receitas'

    expect(page).to have_content("Olá #{user.email}")

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
