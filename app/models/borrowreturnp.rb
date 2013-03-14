class Borrowreturn < ActiveRecord::Base
	def Borrowreturn.findBorrow studentid
		z = studentid.to_i() # studentid is String
		@find = Borrowreturn.find(:all,:conditions=>{:studentid=>studentid})
		@find.each do |user|
			currenttime = Time.now
			#if(user.duedate<currenttime)
			due = user.duedate
			user.fee = ((due-currenttime)/(60*60*24))*10
			#end
		end
		return @find
  	end

	def Borrowreturn.add bid
		#find book name via book id
		book = Bookdb.find_by_barcode(bid)
		return book
	end
end
