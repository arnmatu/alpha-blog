class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end


  def new
    @article = Article.new
  end

  def edit
      #@article = Article.new(article_params)
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice]="Article was successfully created"
      redirect_to article_path(@article) #from rake routes and passing article instance variable
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice]="Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    #@article = Article.find(params[:id])
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash[:notice]="Article was successfully deleted"
  end



  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,:description)
    end

end
