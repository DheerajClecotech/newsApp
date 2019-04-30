class Article < ApplicationRecord
	scope :enable, -> { where(enable: true, publishedAt: Date.current) }

	def self.today_news
		articles = Article.where(publishedAt: Date.current)
		if articles.present?
			articles
		else
			Article.destroy_all
			response = HTTParty.get('https://newsapi.org/v2/top-headlines?country=in&category=politics&apiKey=4aeb8bafb1e843038934b02b635ac2b8')
			data = JSON.parse(response.body)
			articles = ActiveSupport::JSON.decode(data.to_json)["articles"]
			articles.each_with_index do |value, index|
				Article.find_or_create_by(author: value["author"], content: value["content"], description: value["description"], publishedAt: value["publishedAt"], title:  value["title"], url: value["url"], urlToImage: value["urlToImage"])
			end
			Article.where(publishedAt: Date.current)
		end
	end
end
