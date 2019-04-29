# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = HTTParty.get('https://newsapi.org/v2/top-headlines?country=in&category=sport&apiKey=4aeb8bafb1e843038934b02b635ac2b8')
		data = JSON.parse(response.body)
		articles = ActiveSupport::JSON.decode(data.to_json)["articles"]
		articles.each_with_index do |value, index|
			Article.find_or_create_by(author: value["author"], content: value["content"], description: value["description"], publishedAt: value["publishedAt"], title:  value["title"], url: value["url"], urlToImage: value["urlToImage"], enable: true)
		end