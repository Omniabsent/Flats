require 'rails_helper'

describe 'Admin registers regions' do
  it 'successfully' do

    visit root_path
    click_on 'Criar nova região'
    fill_in 'Nova região', with: 'Sul'
    click_on 'Enviar'

    expect(page).to have_content('Sul')

  end

  it 'and is unable to register a nameless region' do

    visit root_path
    click_on 'Criar nova região'
    fill_in 'Nova região', with: ''
    click_on 'Enviar'

    expect(page).to have_content('região não pode ficar em branco')

  end

  it 'and is unable to register a repeated region' do
    PlaceRegion.create!(name: 'Norte')

    visit root_path
    click_on 'Criar nova região'
    fill_in 'Nova região', with: 'Norte'
    click_on 'Enviar'

    expect(page).to have_content('região já existente')

  end
end
