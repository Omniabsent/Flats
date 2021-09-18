require 'rails_helper'

describe 'Visitor visit homepage' do
  it  'and view places' do
    Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2})
    Place.create({title: "Kitnet em SP", description: "Kitnet mobiliada", rooms: 1})

    visit root_path

    expect(page).to have_text("Casa em Curitiba")
    expect(page).to have_text("Casa com vaga em garagem")
    expect(page).to have_text("Quartos: 2")
#    expect(page).to have_text("Available")
    expect(page).to have_text("Kitnet em SP")
    expect(page).to have_text("Kitnet mobiliada")
    expect(page).to have_text("Quartos: 1")
#    expect(page).to have_text("Unavailable")
  end

end
