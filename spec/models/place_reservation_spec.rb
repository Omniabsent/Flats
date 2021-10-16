require 'rails_helper'

RSpec.describe PlaceReservation, type: :model do
  describe '#valid?' do
    context 'should not be valid if' do
      it 'end date greater than start date' do
        place_type = PlaceType.create!(name: 'Casa')
        place_region = PlaceRegion.create!(name: 'Baixada Santista')
        place_owner = PlaceOwner.create!(email:'john@dee.com', password: '123456')
        place = Place.create!(title:'Casa na praia', description:'Casa em área susceptível a tsunami', rooms: 3, bathrooms: 2, pets: true, parking_slot: true, rent:300, place_type: place_type, place_region: place_region, place_owner: place_owner)
        visitor = Visitor.create!(email:'peter@parker.com', password: '123123')
        place_reservation = PlaceReservation.new(start_date: 5.days.from_now, end_date: 3.days.from_now, place: place, visitor: visitor)

        expect(place_reservation.valid?).to eq false
      end

      it 'end date equal to start date' do
        place_type = PlaceType.create!(name: 'Casa')
        place_region = PlaceRegion.create!(name: 'Baixada Santista')
        place_owner = PlaceOwner.create!(email:'john@dee.com', password: '123456')
        place = Place.create!(title:'Casa na praia', description:'Casa em área susceptível a tsunami', rooms: 3, bathrooms: 2, pets: true, parking_slot: true, rent:300, place_type: place_type, place_region: place_region, place_owner: place_owner)
        visitor = Visitor.create!(email:'peter@parker.com', password: '123123')
        place_reservation = PlaceReservation.new(start_date: 5.days.from_now, end_date: 5.days.from_now, place: place, visitor: visitor)

        expect(place_reservation.valid?).to eq false

      end

      it 'start date is in the past' do
        place_type = PlaceType.create!(name: 'Casa')
        place_region = PlaceRegion.create!(name: 'Baixada Santista')
        place_owner = PlaceOwner.create!(email:'john@dee.com', password: '123456')
        place = Place.create!(title:'Casa na praia', description:'Casa em área susceptível a tsunami', rooms: 3, bathrooms: 2, pets: true, parking_slot: true, rent:300, place_type: place_type, place_region: place_region, place_owner: place_owner)
        visitor = Visitor.create!(email:'peter@parker.com', password: '123123')
        place_reservation = PlaceReservation.new(start_date: 5.days.ago, end_date: 3.days.from_now, place: place, visitor: visitor)

        expect(place_reservation.valid?).to eq false

      end
    end
  end
end
