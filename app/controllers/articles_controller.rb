class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		if params[:status] == 'disable'
			@articles = Article.where(enable: false, publishedAt: Date.current)
		elsif params[:status] == 'enable'
			@articles = Article.where(enable: true, publishedAt: Date.current)
		else
			@articles = Article.today_news
		end
	end

	
	def update
		@article = Article.find(params[:id])
		@article.update(enable: params[:status])
	end

end
