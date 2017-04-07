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
  end
