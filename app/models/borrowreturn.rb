class Borrowreturn < ActiveRecord::Base
	def Borrowreturn.findBorrow studentid
		#@books = Array.new
		#z = studentid.to_i() # studentid is String
		#counti = 0
		#while(Borrowreturn.find_by_studentid(z))			
		#	@books[counti] = Borrowreturn.find_by_studentid(z)
		#	counti = counti + 1
    		#end
		#return @books
  	end
	def Borrowreturn.add(bid,stuid)
		stuidi = stuid.to_i()
		#find book name via book id
		book = Bookdb.find_by_callnum(bid)
		bname = book.name
		bbarcode = book.barcode
		time = Time.new
		strtime = time.strftime("%d-%m-%Y")
		duedate = time + (24*60*60)
		strduedate = duedate.strftime("%d-%m-%Y")
		Borrowreturn.create!(:studentid=>stuidi,:bookname=>bname,:borrowdate=>strtime,:duedate=>strduedate,:bookid=>bid,:barcode=>bbarcode,:fee=>0)
	end
end
