class AddbookController < ApplicationController
  def index
  end

  def createnewbook
	 @bcode = params[:barcode]
	 @bname = params[:bookname]
	 @bid = params[:bookid]
	if(!Bookdb.createnewbook(@bcode,@bname,@bid))
    	#flash[:notice] = "#{@newacc.name} added"
    	redirect_to "/addbook/popup" # The popup is message to user 
    else
        flash[:notice] = "This Book is available in the system"
        redirect_to "/addbook/error"
    end
  end

  def accessuser

  end

end
