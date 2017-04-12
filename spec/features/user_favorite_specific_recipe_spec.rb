require 'rails_helper'

feature 'User choose a specific recipe as favorite' do
  scenario 'Successfully' do
    user = create(:user)

    cookery = create(:cookery)

    food = create(:food)

    recipe = create(:recipe, user: user, cookery: cookery, food: food)

    login_as(user, :scope => :user)

    visit root_path

    click_on 'bolo'

    click_on 'Favoritar'

    expect(page).to have_content 'Receita adicionada aos favoritos'

  end

  scenario 'view his favorite recipes' do
    user = create(:user, email: 'te1231223@hotmail.com')

    cookery = create(:cookery)

    food = create(:food)

    recipe = create(:recipe, user: user, cookery: cookery, food: food)

    login_as(user, :scope => :user)

    visit root_path

    click_on 'bolo'

    click_on 'Favoritar'

    click_on 'Favoritas'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.food.name
    expect(page).to have_content recipe.cookery.name
    expect(page).to have_content recipe.difficult
  end

  scenario 'and unfavorite' do
    user = create(:user, email: 'te1231223@hotmail.com')

    cookery = create(:cookery)

    food = create(:food)

    recipe = create(:recipe, user: user, cookery: cookery, food: food)

    login_as(user, :scope => :user)

    visit root_path

    click_on 'bolo'

    click_on 'Favoritar'

    click_on 'Favoritas'

    click_on 'unfavorite'

    expect(page).to have_content 'Receita excluída dos favoritos'
  end
end
