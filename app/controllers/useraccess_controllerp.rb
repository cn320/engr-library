class UseraccessController < ApplicationController

	def index
	end
	
	def accessuser
      		if @x = Userlist.loginstudent(params[:studentids])
	 		session[:studentname] = Userlist.getstudentname(params[:studentids])
         		session[:studentid] = params[:studentids]
			redirect_to "/useraccess/loginsuccess"
		else
         		flash[:notice] = 'login failed'
      	 		@z = "NO LOGIN"
      	 		redirect_to "/useraccess/index"
      		end
	end

	def createnewuser
	end

	def borrowbook
		book = Borrowreturn.add(params[:bid])
		if(book != nil)
			bname = book.name
			bookid = book.callnum
			time = Time.new
			#strtime = time.strftime("%d-%m-%Y")
			duedate = time + (24*60*60*10)
			#strduedate = duedate.strftime("%d-%m-%Y")
			Borrowreturn.create!(:studentid=>session[:studentid],:bookname=>bname,:borrowdate=>time,:duedate=>duedate,:bookid=>bookid,:barcode=>params[:bid],:fee=>0)
			redirect_to "/useraccess/main"
		else
			#book not exist
			redirect_to "/useraccess/main"
		end
	end

	def main

		@find = Borrowreturn.findBorrow(session[:studentid])	
	end

	def checknewstudent
		if(!Userlist.find_by_stucolid(params[:stuid]))
    		 	@newacc = Userlist.create!(:stucolid=>params[:stuid],:name=>params[:stuname],:surname=>params[:stusurname])
    			flash[:notice] = "#{@newacc.name} added"
    			redirect_to "/useraccess/popup" # The popup is message to user 
    		else
        		flash[:notice] = "This student is already to register"
        		redirect_to "/useraccess/createnewuser"	
		end
	end
end
