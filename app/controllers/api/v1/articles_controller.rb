class Api::V1::ArticlesController < ApplicationController

	def index
		@articles = Article.today_news
		render json:  @articles.enable
	end

end