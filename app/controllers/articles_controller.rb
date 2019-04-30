class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		if params[:status] == 'disable'
			@articles = Article.disable
		elsif params[:status] == 'enable'
			@articles = Article.enable
		else
			@articles = Article.today_news
		end
	end

	
	def update
		@article = Article.find(params[:id])
		@article.update(enable: params[:status])
	end

end
