require 'rails_helper'

describe Place do
  context 'validations' do
    it 'title must be present' do
      place = Place.new
      place.valid?
      expect(place.errors.full_messages_for(:title)).to include("Título não pode ficar em branco")
    end

    it 'description must be present' do
      place = Place.new
      place.valid?
      expect(place.errors.full_messages_for(:description)).to include("Descrição não pode ficar em branco")
    end

    it 'rooms must be present' do
      place = Place.new
      place.valid?
      expect(place.errors.full_messages_for(:rooms)).to include("Quartos não pode ficar em branco")
    end

    it 'bathrooms must be present' do
      place = Place.new
      place.valid?
      expect(place.errors.full_messages_for(:bathrooms)).to include("Banheiros não pode ficar em branco")
    end

    it 'rent must be present' do
      place = Place.new
      place.valid?
      expect(place.errors.full_messages_for(:rent)).to include("Aluguel não pode ficar em branco")
    end
  end
end
