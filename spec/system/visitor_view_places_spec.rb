require 'rails_helper'

describe 'Visitor visit homepage' do
  it  'and view places' do
    PlaceType.create(name:'Casa')
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1 })
    Place.create({title: "Kitnet em SP", description: "Kitnet mobiliada", rooms: 1,  bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1 })

    visit root_path

    expect(page).to have_text("Casa em Curitiba")
    expect(page).to have_text("Casa com vaga em garagem")
    expect(page).to have_text("Quartos: 2")
    expect(page).to have_text("Kitnet em SP")
    expect(page).to have_text("Kitnet mobiliada")
    expect(page).to have_text("Quartos: 1")
  end

  it 'and view place details' do
    PlaceType.create(name:'Casa')
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1 })

    visit root_path
    click_on "Casa em Curitiba"

    expect(page).to have_text("Casa em Curitiba")
    expect(page).to have_text("Casa com vaga em garagem")
    expect(page).to have_text("Quartos: 2")
    expect(page).to have_text("Banheiros: 1")
    expect(page).to have_text("Aceita pets: Sim")
    expect(page).to have_text("Estacionamento: Sim")
    expect(page).to have_text("Diária: R$100")

  end


  it 'or view "no place available" warning if no place available' do

    visit root_path

    expect(page).to have_text("Nenhum imóvel disponível")

  end

  it 'and return to home' do
    PlaceType.create(name:'Casa')
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type_id: 1 })
    
    visit root_path
    click_on "Casa em Curitiba"
    click_on "Voltar"

    expect(current_path).to eq root_path
  end


end
