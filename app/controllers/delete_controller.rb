class DeleteController < ApplicationController

  def index
        @bookName = params[:bookname]
	@books = Bookdb.find(:all , :conditions =>{:name => params[:bookname]})
        #@books = params[:bookname]
        #@books = Bookdb.all
	session[:bookname] = @bookName
  end

  def search
  end

  def show
	id = params[:id] # retrieve movie ID from URI route
        @book = Bookdb.find(id) # look up movie by unique ID
  end

  def destroy
    id = params[:id]
    @book = Bookdb.find(id)
    @book.destroy
    flash[:notice] = "Movie '#{@book.name}' deleted."
    redirect_to delete_index_path
  end   
end
