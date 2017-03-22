require 'rails_helper'

feature 'User search for specific recipe' do
  scenario 'Successfully on index' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user, food: food)

    otherRecipe = create(:recipe, name: 'bomba de chocolate')

    visit root_path

    fill_in 'search', with: 'bolo'

    click_on 'Buscar'

    expect(page).to have_content recipe.name
  end

  scenario 'Successfully on my recipes' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user, food: food)

    otherRecipe = create(:recipe, name: 'bomba de chocolate')

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    click_on 'Minhas Receitas'

    fill_in 'search', with: otherRecipe.name

    click_on 'Buscar'

    expect(page).to have_content otherRecipe.name

  end
end
