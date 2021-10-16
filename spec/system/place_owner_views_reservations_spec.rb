require 'rails_helper'

describe 'Place owner sees reservations' do
  it 'should view reservations to his places' do
    peter = PlaceOwner.create!(email:'peter@parker.com', password: '123456')
    jane = PlaceOwner.create!(email:'jane@doe.com', password: '123456')
    visitor = Visitor.create!(email:'sir@john.com', password: '123456')

    place_type = PlaceType.create!(name: 'Casa')
    place_region = PlaceRegion.create!(name: 'Sudeste')

    janes_place = Place.create!(title:'Casa na praia', description:'Casa em área susceptível a tsunami', rooms: 3, bathrooms: 2, pets: true, parking_slot: true, rent:300, place_type: place_type, place_region: place_region, place_owner: jane)
    peters_place = Place.create!(title:'Casa na montanha', description:'Casa em lugar que o ônibus não chega', rooms: 2, bathrooms: 1, pets: true, parking_slot: false, rent:200, place_type: place_type, place_region: place_region, place_owner: peter)

    PlaceReservation.create!(start_date: '01/10/2100', end_date: '05/10/2100', place: janes_place, visitor: visitor)
    PlaceReservation.create!(start_date: '05/10/2100', end_date: '10/10/2100', place: peters_place, visitor: visitor)

    login_as peter, scope: :place_owner
    visit root_path
    click_on 'Meus imóveis'
    click_on 'Casa na montanha'

    expect(page).to_not have_content('Reserve agora')
    expect(page).to have_content('Reservas')
    expect(page).to have_content('Reserva de')
    expect(page).to have_content('Data de início: 2100-10-05')
    expect(page).to have_content('Data de final: 2100-10-10')
    expect(page).to_not have_content('2100-10-01')
    expect(page).to have_content('Status: pending')
  end

  it 'and should not view reservations for other owners' do
    peter = PlaceOwner.create!(email:'peter@parker.com', password: '123456')
    jane = PlaceOwner.create!(email:'jane@doe.com', password: '123456')
    visitor = Visitor.create!(email:'sir@john.com', password: '123456')

    place_type = PlaceType.create!(name: 'Casa')
    place_region = PlaceRegion.create!(name: 'Sudeste')

    janes_place = Place.create!(title:'Casa na praia', description:'Casa em área susceptível a tsunami', rooms: 3, bathrooms: 2, pets: true, parking_slot: true, rent:300, place_type: place_type, place_region: place_region, place_owner: jane)
    peters_place = Place.create!(title:'Casa na montanha', description:'Casa em lugar que o ônibus não chega', rooms: 2, bathrooms: 1, pets: true, parking_slot: false, rent:200, place_type: place_type, place_region: place_region, place_owner: peter)

    PlaceReservation.create!(start_date: '01/10/2100', end_date: '05/10/2100', place: janes_place, visitor: visitor)
    PlaceReservation.create!(start_date: '06/10/2100', end_date: '10/10/2100', place: peters_place, visitor: visitor)

    login_as jane, scope: :place_owner
    visit root_path
    click_on 'Casa na montanha'

    expect(page).to_not have_content('Reserve agora')
    expect(page).to_not have_content('Reservas')
    expect(page).to_not have_content('Reserva de')
    expect(page).to_not have_content('Data de início: 2100-10-06')
    expect(page).to_not have_content('Data de final: 2100-10-10')
    expect(page).to_not have_content('2100-10-01')
  end

  it 'and approve reservation' do
    peter = PlaceOwner.create!(email:'peter@parker.com', password: '123456')
    visitor = Visitor.create!(email:'sir@john.com', password: '123456')
    place_type = PlaceType.create!(name: 'Casa')
    place_region = PlaceRegion.create!(name: 'Sudeste')
    place = Place.create!(title:'Casa na montanha', description:'Casa em lugar que o ônibus não chega', rooms: 2, bathrooms: 1, pets: true, parking_slot: false, rent:200, place_type: place_type, place_region: place_region, place_owner: peter)
    PlaceReservation.create!(start_date: '06/10/2100', end_date: '10/10/2100', place: place, visitor: visitor)

    login_as peter, scope: :place_owner
    visit root_path
    click_on 'Meus imóveis'
    click_on 'Casa na montanha'
    click_on 'Aceitar reserva'

    expect(current_path).to eq place_path(place)
    expect(page).to_not have_content('Reserve agora')
    expect(page).to have_content('Reservas')
    expect(page).to have_content('Reserva de')
    expect(page).to have_content('Data de início: 2100-10-06')
    expect(page).to have_content('Data de final: 2100-10-10')
    expect(page).to have_content('Status: accepted')
  end
end
