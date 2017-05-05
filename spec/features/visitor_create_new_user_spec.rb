require 'rails_helper'
feature 'Visitor create new user' do
  scenario 'Sucessfully' do

    visit root_path

    click_on 'Cadastrar usuários'

    fill_in 'Email', with: 'henriquepjv@hotmail.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmação de senha', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content("Olá henriquepjv@hotmail.com")
  end

  scenario 'and notify through email' do
    expect(UserMailer).to receive(:notify_new_user).once.and_call_original

    user = build(:user)

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '123456'
    fill_in 'Confirmação de senha', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content("Minhas Receitas")
  end
end
