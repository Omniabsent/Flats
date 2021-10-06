require 'rails_helper'

describe 'Places owned sees their own places' do
  it 'using menu' do
    place_owner = PlaceOwner.create!(email: 'john@dee.com.br', password: '12345678')

    login_as place_owner, scope: :place_owner
    visit root_path

    expect(page).to have_link('Meus imóveis', href: my_places_places_path)
  end

  it 'and should view own places' do
    jane = PlaceOwner.create!(email: 'jane@dee.com.br', password: '12345678')
    peter = PlaceOwner.create!(email: 'peter@parker.com.br', password: '12345678')
    PlaceType.create(name:'Casa')
    PlaceRegion.create(name:'Sul')
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1, place_region_id: 1, place_owner: jane })
    PlaceType.create(name:'Kitnet')
    PlaceRegion.create(name:'Sudeste')
    Place.create({title: "Kitnet em SP", description: "Kitnet mobiliada", rooms: 1,  bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 2, place_region_id: 2, place_owner: peter })


    login_as jane, scope: :place_owner
    visit root_path
    click_on 'Meus imóveis'

    expect(page).to have_content('Casa em Curitiba')
    expect(page).not_to have_content('Kitnet em SP')
  end

  it 'and has no places yet' do
    peter = PlaceOwner.create!(email: 'peter@parker.com.br', password: '12345678')

    login_as peter, scope: :place_owner
    visit root_path
    click_on 'Meus imóveis'

    expect(page).to have_content('Você ainda não cadastrou nenhum imóvel')
    expect(page).to have_content('Cadastrar seu primeiro imóvel', new_place_path)

  end
end
