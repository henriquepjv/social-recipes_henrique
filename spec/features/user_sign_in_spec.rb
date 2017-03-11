require 'rails_helper'

feature 'User sign in' do
  scenario 'from home page' do

    user = create(:user)

    visit root_path

    click_on 'Entrar'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Login'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Olá #{user.email}")

  end
end
