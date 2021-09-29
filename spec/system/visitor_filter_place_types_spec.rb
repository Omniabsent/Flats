require 'rails_helper'

describe 'Visitor filter places by type' do
  it 'should view links on nav bar' do
    PlaceType.create!(name: 'Apartamento')
    PlaceType.create!(name: 'Casa')
    PlaceType.create!(name: 'Sítio')

    visit root_path

    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
  end

  it 'successfully' do
    apartamento = PlaceType.create!(name: 'Apartamento')
    casa = PlaceType.create!(name: 'Casa')
    sitio = PlaceType.create!(name: 'Sítio')
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type: casa })
    Place.create({title: "Apartamento em SP", description: "Apartamento mobiliado", rooms: 1,  bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type: apartamento })

    visit root_path
    click_on "Apartamento"

    expect(page).to have_css('h1', text: 'Imóveis do tipo: Apartamento')
    expect(page).to have_link('Apartamento em SP')
    expect(page).not_to have_content('Casa em Curitiba')
  end
end
