require 'json'

Product.create! name: 'Kleines Getränk', price: 1.0, order: 1
Product.create! name: 'Großes Getränk', price: 2.0, order: 2
Product.create! name: 'Kuchen', price: 1.5, order: 3
Product.create! name: 'Kaltgetränk', price: 1.5, order: 4

JSON.parse(Net::HTTP.get(URI('https://www.railslove.com/api/people'))).each do |user|
  User.create! first_name: user['name'], email: user['email']
end
