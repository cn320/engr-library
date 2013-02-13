class ChangepriceController < ApplicationController
  
  def index
  end
  
  def valuechange
	 redirect_to "/changeprice/popup"
	 @bborrow = params[:bacborrow]
	 @bexp = params[:bacexp]
	 @mborrow = params[:masborrow]
	 @mexp = params[:masexp]
	 @pborrow = params[:proborrow]
	 @pexp = params[:proexp]   
    #@price = Movie.find params[:id]
    #@price.update_attributes!(params[:movie])
    #flash[:notice] = "#{@movie.title} was successfully updated."
    #redirect_to movie_path(@movie)

    if(!Changeprice.changenewvalue(@bborrow,@bexp,@mborrow,@mexp,@pborrow,@pexp))
    	flash[:notice] = " added"
    	redirect_to "/changeprice/index" # The popup is message to user 
    else
        flash[:notice] = "This Book is available in the system"
        #redirect_to "/addbook/error"
    end
  end

end
