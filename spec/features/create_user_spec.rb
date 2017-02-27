require 'rails_helper'

feature 'Create new user' do
  scenario 'successfully' do
    user = User.new(name: 'Henrique', email: 'henriquepjv@hotmail.com',
                    encrypted_password: '123456', administrator: true)

    visit new_user_path

    fill_in 'Nome do usuário', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.encrypted_password
    page.check 'Administrador'

    click_on 'Cadastrar usuário'

    expect(page).to have_content user.name
    expect(page).to have_content user.email
    expect(page).to have_content user.encrypted_password
    expect(page).to have_content user.administrator
  end

  scenario 'With invalid data' do

    visit new_user_path

    click_on 'Cadastrar usuário'

    expect(page).to have_content 'Dado inválido'

  end

end
