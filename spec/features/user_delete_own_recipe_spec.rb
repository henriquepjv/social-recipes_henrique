require 'rails_helper'

feature 'User delete his own recipes' do
  scenario 'Successfully' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user, food: food, name: 'milho', cookery: cookery)


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

    click_on 'Deletar'

    expect(page).not_to have_content recipe.name
    expect(page).not_to have_content recipe.food.name
    expect(page).not_to have_content recipe.cookery.name
    expect(page).not_to have_content recipe.difficult
    expect(page).not_to have_content recipe.ingredients
    expect(page).not_to have_content recipe.steps
    expect(page).not_to have_content recipe.people_portion

  end
end
