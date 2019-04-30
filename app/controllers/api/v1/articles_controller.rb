class Api::V1::ArticlesController < ApplicationController

	def index
		@articles = Article.enable
		render json:  @articles
	end
end