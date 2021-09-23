require 'rails_helper'

describe 'Visitor register place' do
  it 'successfully' do

    visit root_path
    click_on 'Cadastrar imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', whis: 200
    check 'Aceita pets'
    check 'Tem garagem'
    click_on 'Enviar'
  end
end
