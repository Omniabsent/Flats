require 'rails_helper'

describe 'Place owner register place' do
  it 'must be signed in' do

    visit root_path

    expect(page).not_to have_link('Cadastrar imóvel')
  end

  it 'successfully' do
    jane = PlaceOwner.create!(email: 'jane@doe.com.br', password: '12345678')
    PlaceType.create(name:'Casa')
    PlaceRegion.create(name:'Sul')

    login_as jane, scope: :place_owner
    visit root_path
    click_on 'Cadastrar imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    select 'Casa', from: "Tipo"
    select 'Sul', from: "Região"
    check 'Aceita pets'
    check 'Tem garagem'
    click_on 'Enviar'

    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto da UFSC')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2')
    expect(page).to have_content('Aceita pets: Sim')
    expect(page).to have_content('Estacionamento: Sim')
    expect(page).to have_content('Diária: R$ 200,00')
    expect(page).to have_content('Tipo: Casa')
    expect(page).to have_content('Proprietário: jane@doe.com.br')

  end

  it 'and must fill all fields' do
    place_owner = PlaceOwner.create!(email: 'john@dee.com.br', password: 'asdfasdf')
    login_as place_owner, scope: :place_owner
    visit root_path
    click_on 'Cadastrar imóvel'
    click_on 'Enviar'

    #expect(page).to have_content('não pode ficar em branco')
    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Quartos não pode ficar em branco')
    expect(page).to have_content('Banheiros não pode ficar em branco')
    expect(page).to have_content('Aluguel não pode ficar em branco')
  end
end
