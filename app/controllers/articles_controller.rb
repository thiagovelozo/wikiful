class ArticlesController < ApplicationController
	before_filter :authorize, only: [:new, :edit, :update]

	def index
		@articles = Article.order(updated_at: :desc).limit(5)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
  if @article.save
    redirect_to @article, notice: 'Your article has been published!'
  else
    render "new"
  end
end

private
  def article_params
    params.require(:article).permit(:title, :content, :category_ids => [])
  end

end 