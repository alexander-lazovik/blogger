class ArticlesController < ApplicationController
    include ArticlesHelper
    before_action :find_article, only: [:show, :destroy, :update, :edit]
    before_action :require_login, only: [:new, :create, :destroy, :update, :edit]
    
    def index
        @articles = Article.all 
    end
    
    def show
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    
    def new
        @article = Article.new
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash.notice = "Article '#{@article.title}' Created!"
            redirect_to article_path(@article)
        else
            render :new
        end
    end
    
    def destroy
        @article.destroy
        flash.notice = "Article '#{@article.title}' Deleted!"
        redirect_to articles_path()
    end
    
    def edit
    end
    
    def update 
        if @article.update(article_params)
            flash.notice = "Article '#{@article.title}' Updated!"
            redirect_to article_path(@article)
        else
            render :edit
        end
    end
    
    private
    
    def find_article
        @article = Article.find(params[:id])
    end        
    
end
