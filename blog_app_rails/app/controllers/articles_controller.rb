class ArticlesController < ApplicationController
	before_filter :logged_in?

	def index
		@articles = Article.all
		render :index
	end

	def new
		@article = Article.new
		render :new
	end

	def create
		new_article = params.require(:article).permit(:title, :content)
		article = current_user.articles.create(new_article)
		redirect_to article_path(article.id)
	end 

	def show
		@article = Article.find(params[:id])
		@keywordResults = @article.make_request
		render :show
	end

	def edit
		@article = Article.find(params[:id])
		render :edit
	end

	def update
		article = Article.find(params[:id])
		updated_attributes = params.require(:article).permit(:title, :content)
		article.update_attributes(updated_attributes)
		redirect_to article_path(article.id)
	end

	def destroy
		article = Article.find(params[:id])
		article.destroy
		redirect_to articles_path
	end

	def require_login
    	unless @current_user 
	      	flash[:error] = "You must be logged in to access this section"
	      	redirect_to "/login"
    	end
  	end
  
end
