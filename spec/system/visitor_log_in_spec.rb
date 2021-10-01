require 'rails_helper'

describe 'Visitor logs in' do
  it 'successfully' do
    user = User.create(email: 'john@dee.com.br', password: 'asdf')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Login'

    expect(page).to have_content('Logado com sucesso')
    expect(page).to have_content(user.email)
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Login')
  end
end
