class AddbookController < ApplicationController
  def index
  end

  def createnewbook
	if(!Bookdb.find_by_barcode(params[:barcode]))
    	@newacc = Bookdb.create!(:name=>params[:bookname],:callnum=>params[:bookid],:barcode=>params[:barcode])
    	flash[:notice] = "#{@newacc.name} added"
    	redirect_to "/addbook/popup" # The popup is message to user 
    else
        flash[:notice] = "This Book is available in the system"
        redirect_to "/addbook/popup"
    end
  end

  def accessuser

  end

end
