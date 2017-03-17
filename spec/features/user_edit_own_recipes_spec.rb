require 'rails_helper'

feature 'User edit his own recipes' do
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

    click_on 'Editar'

    fill_in 'Nome da receita', with: 'bolo'
    select cookery.name, from: 'Cozinha'
    select food.name, from: 'Tipo de comida'
    fill_in 'Quantas pessoas serve', with: recipe.people_portion
    fill_in 'Tempo de preparo', with: recipe.preparation_time
    fill_in 'Nível de dificuldade', with: recipe.difficult
    fill_in 'Ingredientes', with: recipe.ingredients
    fill_in 'Passo a passo', with: recipe.steps

    click_on 'Cadastrar receita'
    
    expect(page).to have_content 'bolo'
    expect(page).to have_content recipe.food.name
    expect(page).to have_content recipe.cookery.name
    expect(page).to have_content recipe.difficult
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.steps
    expect(page).to have_content recipe.people_portion

  end
end
