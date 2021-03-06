class Borrowreturn < ActiveRecord::Base
	def Borrowreturn.add(bid,stuid)
		stuidi = stuid.to_i()
		if( book = Bookdb.find_by_callnum(bid) )
		  	bname = book.name
		  	bbarcode = book.barcode
		  	time = Time.new
		  	strtime = DateTime.now	
	
			# Calculate PRICE check
		  	userid = Userlist.find_by_stucolid(stuid)
 		  	userstatus = userid.status
		  	strduedate = time  + (Changeprice.find_by_id(userstatus).checkoutdate*3600*24)
 	        	#strduedate = time  - (3600*24*50)
		  	Borrowreturn.create!(:studentid=>stuidi,:bookname=>bname,:borrowdate=>strtime,:duedate=>strduedate,:bookid=>bid,:barcode=>bbarcode,:fee=>0)
		else
		  	@newborrow = "Don't have in Database"
		end	
	end

	def Borrowreturn.calculatefee(stuid,duedateTime)
		userid = Userlist.find_by_stucolid(stuid)
 		userstatus = userid.status

		presentTime = Time.now
		if(duedateTime >= presentTime)
		  	0
		else
		  	x = ((presentTime.to_i - duedateTime.to_i) / (3600*24)) * Changeprice.find_by_id(userstatus).price
		end
		  
	end
end
