class ChangepriceController < ApplicationController
  
  def index
  end
  
  def show
	if(Changeprice.exists?)
	  	@bac1 = Changeprice.find(1)
		@bac2 = Changeprice.find(1)
	  	@mac1 = Changeprice.find(2)
		@mac2 = Changeprice.find(2)
	  	@pac1 = Changeprice.find(3)
		@pac2 = Changeprice.find(3)

		#@bac = Changeprice.find(1)
	  	#@mac = Changeprice.find(2)
	  	#@pac = Changeprice.find(3)
 	else
	  	@bac = Changeprice.create(:id=>'1',:type=>'Bachelor',:checkoutdate=>'0',:price=>'0')
	  	@mac = Changeprice.create(:id=>'2',:type=>'Master',:checkoutdate=>'0',:price=>'0')
	  	@pac = Changeprice.create(:id=>'3',:type=>'Professor',:checkoutdate=>'0',:price=>'0')
	end
  end

  def update
	    @bachelor = Changeprice.find(1) 
	    @bachelor.update_attributes!(params[:bac1])
	    @bachelor.update_attributes!(params[:bac2])
	    @master = Changeprice.find(2) 
	    @master.update_attributes!(params[:mac1])
	    @master.update_attributes!(params[:mac2])
	    @proff = Changeprice.find(3) 
	    @proff.update_attributes!(params[:pac1])
	    @proff.update_attributes!(params[:pac2])
	    #redirect_to movie_path(@movie)
  end
end
