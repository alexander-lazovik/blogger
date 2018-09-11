class AuthorsController < ApplicationController
  include AuthorsHelper
  before_action :find_author, only: [:edit, :show, :destroy, :update]
  
  def index
    @authors = Author.all
  end
  
  def new
    @author = Author.new
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @author.update(author_params)
      flash.notice = "Author '#{@author.name}' Updated!"
      redirect_to @author
    else
      render :edit
    end
  end
  
  def create
    @author = Author.create(author_params)
    if @author
      flash.notice = "Author '#{@author.name}' Created!"
      redirect_to @author
    else
      render :new
    end
  end
  
  def destroy
    @author.destroy
    flash.notice = "Author '#{@author.name}' Deleted!"
    redirect_to authors_path
  end
  
  private
  def find_author
    @author = Author.find(params[:id])
  end  
  
end