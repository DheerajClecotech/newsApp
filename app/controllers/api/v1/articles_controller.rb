class Api::V1::ArticlesController < ApplicationController

	def index
		@articles = Article.where(enable: true, publishedAt: Date.current)
		respond_to do |format|
      format.json { render(json:  @articles ) }
    end
	end
end