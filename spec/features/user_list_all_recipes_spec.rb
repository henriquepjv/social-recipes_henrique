require 'rails_helper'

feature 'Visitor list all recipes' do
  scenario 'Successfully' do
    cookery = create(:cookery)

    user = create(:user, email: 'xpto@blabla', name: 'José' )

    food = create(:food)

    recipe = create(:recipe, user: user, food: food)

    otherRecipe = create(:recipe, name: 'bomba de chocolate')

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
