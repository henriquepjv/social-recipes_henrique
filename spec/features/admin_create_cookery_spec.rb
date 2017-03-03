require 'rails_helper'

feature 'Administrator creates new cookery' do
  scenario 'Successfully' do

    user = User.new(name: 'Henrique', email: 'henriquepjv@hotmail.com',
                    encrypted_password: '123456', administrator: true)

    cookery = Cookery.new(name: 'Italiana')

    visit new_cookery_path

    fill_in 'Digite o nome da cozinha', with: cookery.name

    click_on 'Cadastrar a cozinha'

    expect(page).to have_content cookery.name

  end

  scenario 'invalid data' do

    visit new_cookery_path

    click_on 'Cadastrar a cozinha'

    expect(page).to have_content 'Dado inválido'

  end

end
