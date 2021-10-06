# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

place_owner = PlaceOwner.create!(email: 'john@dee.com.br', password: '12345678')
sul = PlaceRegion.create(name:'Sul')
norte = PlaceRegion.create(name:'Norte')
casa = PlaceType.create(name:'Casa')
apartamento = PlaceType.create(name:'Apartamento')
Place.create({title: "Casa em Curitiba", description: "Casa com vaga em garagem", rooms: 2, bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type: casa, place_region: sul, place_owner: place_owner })
Place.create({title: "Apartamento em SP", description: "Apartamento mobiliado", rooms: 1,  bathrooms: 1, pets: true, parking_slot: true, rent: "100", place_type: apartamento, place_region: norte, place_owner: place_owner })
