class Borrowreturn < ActiveRecord::Base
	def Borrowreturn.add(bid,stuid)
		stuidi = stuid.to_i()
		#find book name via book id
		book = Bookdb.find_by_callnum(bid)
		bname = book.name
		bbarcode = book.barcode
		time = Time.new
		#strtime = time.strftime("%d-%m-%Y")
		strtime = DateTime.now	
	
		# Calculate PRICE check
		userid = Userlist.find_by_stucolid(stuid)
 		userstatus = userid.status

		strduedate = time  - (Changeprice.find_by_id(userstatus).checkoutdate*3600*24)
		#duedate = time + (24*60*60)
		#strduedate = duedate.strftime("%d-%m-%Y")
		Borrowreturn.create!(:studentid=>stuidi,:bookname=>bname,:borrowdate=>strtime,:duedate=>strduedate,:bookid=>bid,:barcode=>bbarcode,:fee=>0)
	end

	def Borrowreturn.calculatefee(stuid,duedateTime)
	        student = Borrowreturn.find_by_studentid(stuid)

		# check type of User
		#if(stuid > 521)
		#  typeid = '1' #Bachelor
		#else
		#  typeid = '2'
		#end 

		duedateTime = student.duedate
		presentTime = DateTime.now
		if(duedateTime >= presentTime)
		  0
		else
		  #showfee = ((presentTime - duedateTime) / 3600*24) * Changeprice.find_by_id(1).price
		  #x = ((presentTime.to_i - duedateTime.to_i) / 3600*24 ).to_i
		  #x = ((presentTime.to_i - duedateTime.to_i) / 3600*24) * Changeprice.find_by_id(1).price
		  x =presentTime.strftime("%d")
		end
		  
	end
end
