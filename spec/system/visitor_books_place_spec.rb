require 'rails_helper'

describe 'user books place' do
  it 'successfully' do
    owner = PlaceOwner.create!(email: 'jane@doe.com.br', password: '12345678')
    user = Visitor.create!(email: 'peter@parker.com.br', password: '12345678')
    PlaceType.create(name:'Casa')
    PlaceRegion.create(name:'Sul')
    place = Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1, place_region_id: 1, place_owner: owner })

    login_as user, scope: :user
    visit root_path
    click_on place.title
    fill_in 'Data inicial', with: '06/10/2021'
    fill_in 'Data final', with: '17/10/2021'
    fill_in 'Quantidade de pessoas', with: '3'
    click_on 'Requisitar reserva'

    expect(page).to have_content('06/10/2021')
    expect(page).to have_content('17/10/2021')
    expect(page).to have_content(/3/)
    expect(page).to have_content('R$ 1100,00')
    expect(page).to have_content('Reserva requisitada')
  end
end
