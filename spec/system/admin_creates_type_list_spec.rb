require 'rails_helper'

describe 'Admin registers place types' do
  it 'successfully' do

    visit root_path
    click_on 'Criar novo tipo'
    fill_in 'Novo tipo', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_content('Casa')

  end

  it 'and is unable to register a nameless type' do

    visit root_path
    click_on 'Criar novo tipo'
    fill_in 'Novo tipo', with: ''
    click_on 'Enviar'

    expect(page).to have_content('tipo não pode ficar em branco')

  end

  it 'and is unable to register a repeated type' do
    PlaceType.create!(name: 'Casa')

    visit root_path
    click_on 'Criar novo tipo'
    fill_in 'Novo tipo', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_content('tipo já existente')

  end
end
