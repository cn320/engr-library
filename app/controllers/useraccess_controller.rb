class UseraccessController < ApplicationController
	def index
		if(session[:studentid] != nil || session[:user_id])
			
		else
			redirect_to "/bookdbs/index"	
		end
	end
	
	def accessuser
      	  	if @x = Userlist.loginstudent(params[:studentids])
	   		session[:studentname] = Userlist.getstudentname(params[:studentids])
           		session[:studentid] = params[:studentids]
           		@@st = params[:studentids]
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
		@newborrow = Borrowreturn.add(params[:bid],session[:studentid])
	end

	def main
		@status = Borrowreturn.find(:all , :conditions =>{:studentid => 1})
		if(session[:studentid] != nil)
			if(params[:id] != nil)
			   	id = params[:id]
	   		   	@userbook = Borrowreturn.find_by_id(id)
	   		   	@userbook.destroy
	    		   	redirect_to "/useraccess/main"
			end

			if(session[:studentid] != nil && @status != nil)
			   	@stuid = session[:studentid]
			   	@status = Borrowreturn.find(:all , :conditions =>{:studentid => session[:studentid]})
			   
			   	# Calculate Fee
			   	@status.each do |temp|
			     	temp.fee = Borrowreturn.calculatefee(session[:studentid],temp.duedate) 
				end
			else
			   	@stuid = session[:studentid]
			   	@status = Borrowreturn.find(:all , :conditions =>{:studentid => @stuid})
	    		end
		else
			redirect_to "/bookdbs/index"	
		end
	end

	def checknewstudent
		if(!Userlist.find_by_stucolid(params[:stuid]))
    		 	@newacc = Userlist.create!(:stucolid=>params[:stuid],:name=>params[:stuname],:surname=>params[:stusurname],:status=>params[:typeid])
    			flash[:notice] = "#{@newacc.name} added"
    			redirect_to "/useraccess/popup" # The popup is message to user 
    		else
        		flash[:notice] = "This student is already to register"
        		redirect_to "/useraccess/createnewuser"	
		end
	end

        def loginsuccess
		@stuid = session[:studentid] 
        end
end
