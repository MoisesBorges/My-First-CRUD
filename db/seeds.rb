# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating coins..."

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"

)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png"
)

Coin.create!(
  description: "DASH",
  acronym: "DASH",
  url_image: "https://pngimage.net/wp-content/uploads/2018/05/dash-png-9.png"

)

puts "Coins successfully created!"
