class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :destroy, :update, :show]

def index
  @articles = Article.all
end

def new
  @article = Article.new
end

def edit
end

def create
	# for instance, if you just want to display the parameters received for the article creation:
	# render plain: params[:article].inspect

  @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
end

def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully modified"
      redirect_to article_path(@article)
    else
      render 'new'
    end
end

def show
end

def destroy
    @article.destroy
    flash[:notice] = "Article wass successfully deleted"
    redirect_to articles_path
end

	
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
