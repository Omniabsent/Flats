require 'rails_helper'

describe 'Visitor visit homepage' do
  it  'and view places' do
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2})
    Place.create({title: "Kitnet em SP", description: "Kitnet mobiliada", rooms: 1})

    visit root_path

    expect(page).to have_text("Casa em Curitiba")
    expect(page).to have_text("Casa com vaga em garagem")
    expect(page).to have_text("Quartos: 2")
    expect(page).to have_text("Kitnet em SP")
    expect(page).to have_text("Kitnet mobiliada")
    expect(page).to have_text("Quartos: 1")
  end

  it 'and view place details' do
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100"})

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
end