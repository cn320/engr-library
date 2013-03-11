class DeleteController < ApplicationController

  def index
        @bookName = params[:bookname]
	@bookId = params[:bookid]
	@bookBarcode = params[:bookbarcode]
        if ((@bookName != "") and (@bookId != "") and (@bookBarcode != ""))
		@books = Bookdb.find(:all , :conditions =>{:name => params[:bookname], :callnum => params[:bookid], :barcode => params[:bookbarcode] })
        elsif((@bookName != "") and (@bookId != ""))
		@books = Bookdb.find(:all , :conditions =>{:name => params[:bookname], :callnum => params[:bookid]})
	elsif((@bookName != "") and (@bookBarcode != ""))
		@books = Bookdb.find(:all , :conditions =>{:name => params[:bookname], :barcode => params[:bookbarcode]})
	elsif((@bookId != "") and (@bookBarcode != ""))
		@books = Bookdb.find(:all , :conditions =>{:callnum => params[:bookid], :barcode => params[:bookbarcode]})
	elsif((@bookId == "") and (@bookBarcode == ""))
		@books = Bookdb.find(:all , :conditions =>{:name => params[:bookname]})
	elsif((@bookName == "") and (@bookBarcode == ""))
		@books = Bookdb.find(:all , :conditions =>{:callnum => params[:bookid]})
        elsif((@bookName == "") and (@bookId == ""))
		@books = Bookdb.find(:all , :conditions =>{:barcode => params[:bookbarcode]})
	end
        #@books = params[:bookname]
        #@books = Bookdb.all
	#session[:bookname] = @bookName
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
    flash[:notice] = "'#{@book.name}' deleted."
    redirect_to delete_index_path
  end   
end
