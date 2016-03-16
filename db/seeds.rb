require 'json'

Product.create! name: 'Espresso & Kleine Tasse', price: 1.0
Product.create! name: 'Doppelter Espresso & Große Tasse', price: 2.0

JSON.parse(Net::HTTP.get(URI('https://www.railslove.com/api/people'))).each do |user|
  User.create! first_name: user['name'], email: user['email']
end
