# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@client = IEX::Api::Client.new



Stock.create(name:"Advanced Micro Devices", symbol:'AMD', price:sprintf('%.2f',@client.quote('AMD').latest_price), percent_change:@client.quote('AMD').change_percent_s.to_s)

Stock.create(name:"NVIDIA Corporation", symbol:"NVDA", price:sprintf('%.2f',@client.quote('NVDA').latest_price), percent_change:@client.quote('NVDA').change_percent_s.to_s)

Stock.create(name:"GameStop Corp.", symbol:"GME", price:sprintf('%.2f',@client.quote('GME').latest_price), percent_change:@client.quote('GME').change_percent_s.to_s)

Stock.create(name:"Apple Inc.", symbol:"AAPL", price:sprintf('%.2f',@client.quote('AAPL').latest_price), percent_change:@client.quote('AAPL').change_percent_s.to_s)

Stock.create(name:"Alphabet, Inc.", symbol:"GOOG", price:sprintf('%.2f',@client.quote('GOOG').latest_price), percent_change:@client.quote('GOOG').change_percent_s.to_s)

Stock.create(name:"Microsoft Corporation", symbol:"MSFT", price:sprintf('%.2f',@client.quote('MSFT').latest_price), percent_change:@client.quote('MSFT').change_percent_s.to_s)

Stock.create(name:"Twitter, Inc.", symbol:"TWTR", price:sprintf('%.2f',@client.quote('TWTR').latest_price), percent_change:@client.quote('TWTR').change_percent_s.to_s)

Stock.create(name:"Meta Platforms, Inc.", symbol:"META", price:sprintf('%.2f',@client.quote('META').latest_price), percent_change:@client.quote('META').change_percent_s.to_s)

Stock.create(name:"Amazon.com Inc.", symbol:"AMZN", price:sprintf('%.2f',@client.quote('AMZN').latest_price), percent_change:@client.quote('AMZN').change_percent_s.to_s)

Stock.create(name:"Bed Bath & Beyond Inc.", symbol:"BBBY", price:sprintf('%.2f',@client.quote('BBBY').latest_price), percent_change:@client.quote('BBBY').change_percent_s.to_s)

