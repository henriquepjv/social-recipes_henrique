require 'rails_helper'

feature 'User list his own recipes' do
  scenario 'Successfully' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user)

    otherRecipe = create(:recipe, name: 'bomba de chocolate', user: user)

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
  
    click_on 'Login'

    expect(page).to have_content("Olá #{user.email}")

    expect(page).to have_content user.recipes

  end
end
