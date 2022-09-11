# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@client = IEX::Api::Client.new
# @client.quote('AMD').latest_price

Stock.create(name:"Advanced Micro Devices", symbol:'AMD', price:@client.quote('AMD').latest_price)

Stock.create(name:"NVIDIA Corporation", symbol:"NVDA", price:@client.quote('NVDA').latest_price)

Stock.create(name:"GameStop Corp.", symbol:"GME", price:@client.quote('GME').latest_price)

Stock.create(name:"Apple Inc.", symbol:"AAPL", price:@client.quote('AAPL').latest_price)

Stock.create(name:"Alphabet, Inc.", symbol:"GOOG", price:@client.quote('GOOG').latest_price)

Stock.create(name:"Microsoft Corporation", symbol:"MSFT", price:@client.quote('MSFT').latest_price)

Stock.create(name:"Twitter, Inc.", symbol:"TWTR", price:@client.quote('TWTR').latest_price)

Stock.create(name:"Meta Platforms, Inc.", symbol:"META", price:@client.quote('META').latest_price)

Stock.create(name:"Amazon.com Inc.", symbol:"AMZN", price:@client.quote('AMZN').latest_price)

Stock.create(name:"Bed Bath & Beyond Inc.", symbol:"BBBY", price:@client.quote('BBBY').latest_price)

