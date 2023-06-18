# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

country = Country.create(name: 'USA', currency: 'USD')
1.times do
  Merchant.create(name: Faker::Company.name,
                  payout_rate: Faker::Number.between(from: 90, to: 100),
                  country: country)
  client = Client.create(name: Faker::Name.name,
                         payout_rate: Faker::Number.between(from: 90, to: 100),
                         country: country)
  Application.create(name: Faker::Name.name,
                     uid: Faker::Alphanumeric.alphanumeric(number: 10),
                     secret: Faker::Internet.password,
                     client: client)
end

3.times do
  brand = Brand.create(name: Faker::Vehicle.manufacture,
                       redemption: 'instore',
                       merchant: Merchant.first)
  3.times do
    product = Product.create(name: Faker::Vehicle.model,
                             amount: Faker::Number.between(from: 10, to: 1000),
                             brand: brand)
    4.times do
      Card.create(status: 'available',
                  amount: Faker::Number.between(from: 10, to: 1000),
                  product: product)
    end
  end
end