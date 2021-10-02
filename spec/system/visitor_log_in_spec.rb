require 'rails_helper'

describe 'Visitor logs in' do
  context 'as place owner' do
    it 'successfully' do
      place_owner = PlaceOwner.create!(email: 'john@dee.com.br', password: 'asdfasdf')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: place_owner.email
      fill_in 'Senha', with: place_owner.password
      click_on 'Login'

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(place_owner.email)
      expect(page).to have_link('Logout')
      expect(page).to_not have_link('Login')
      expect(page).to have_link('Cadastrar imóvel')
    end

    it 'and logs out' do
      place_owner = PlaceOwner.create!(email: 'john@dee.com.br', password: 'asdfasdf')

      login_as place_owner, scope: :place_owner
      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(place_owner.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_link('Entrar')
      expect(page).to_not have_link('Cadastrar imóvel')
    end

    it 'but first creates account' do
      # TODO: criar esse teste
    end
  end

  context 'as user' do
  end

end
