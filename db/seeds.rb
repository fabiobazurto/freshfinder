# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Zone.destroy_all
coord2 = [
      [
        -123.0597496,
        49.2900901
      ],
      [
        -123.0602646,
        49.2900901
      ],
      [
        -123.0563164,
        49.2581705
      ],
      [
        -123.035717,
        49.2574983
      ],
      [
        -123.0384636,
        49.2899782
      ],
      [
        -123.0597496,
        49.2900901
      ]
    ]

    coord1 = [
      [
        -123.0812931,
        49.2839318
      ],
      [
        -123.0632687,
        49.2862273
      ],
      [
        -123.0629253,
        49.2678606
      ],
      [
        -123.0801773,
        49.2683646
      ],
      [
        -123.0811214,
        49.2837639
      ]
    ]
    

    points = Geo.pairs_to_points(coord1)
    poligono = Geo.polygon(points)   
    Zone.create(name: "V5L A", city: "Vancouver", state: "BC", country: "Canada", full_address:"V5L", coords:poligono )
    
    points = Geo.pairs_to_points(coord2)
    poligono = Geo.polygon(points)   
    Zone.create(name: "V5L B", city: "Vancouver", state: "BC", country: "Canada", full_address:"V5L", coords:poligono )    
