class Article < ApplicationRecord
	scope :enable, -> { where(enable: true) }
	scope :disable, -> { where(enable: false) }

	def self.today_news
		articles_count = Article.where(publishedAt: Date.current).count
		Article.destroy_all unless articles_count != 0
		all_count = Article.count
		response = HTTParty.get('https://newsapi.org/v2/top-headlines?country=in&category=politics&apiKey=4aeb8bafb1e843038934b02b635ac2b8')
		data = JSON.parse(response.body)
		articles = ActiveSupport::JSON.decode(data.to_json)["articles"]
		articles.each_with_index do |value, index|
			Article.find_or_create_by(author: value["author"], content: value["content"], description: value["description"], publishedAt: value["publishedAt"], title:  value["title"], url: value["url"], urlToImage: value["urlToImage"], name: value["source"]["name"])
		end if all_count != articles.count

		Article.where(publishedAt: Date.current).order('enable desc')
	end
end
