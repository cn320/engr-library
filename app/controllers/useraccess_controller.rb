class UseraccessController < ApplicationController
	def index
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
		session[:studentid] = session[:studentidmain]
		if(session[:studentid] == nil)
    		  @stuid = '333333'
		else
		  #@stuid = session[:studentidmain]
		  @stuid = '44444'
		end
		@test = params[:bid]
		@newborrow = Borrowreturn.add(params[:bid],session[:studentid])
		#redirect_to "/useraccess/loginsuccess"
	end
	

	def main
		if(params[:id] != nil)
		   id = params[:id]
   		   @userbook = Borrowreturn.find_by_id(id)
   		   @userbook.destroy
    		   redirect_to "/useraccess/main"
		end

		if(session[:studentid] != nil)
		   #session[:studentid] = '2222'
		   @stuid = session[:studentid]
		   session[:studentidmain] = session[:studentid]
		   #@books = Borrowreturn.find(:all , :conditions =>{:studentid => session[:studentid]})
		   @status = Borrowreturn.find(:all , :conditions =>{:studentid => 0})
		   
		   # Calculate Fee
		   @status.each do |temp|
		     temp.fee = Borrowreturn.calculatefee(0,temp.duedate)
		   end
		else
		   session[:studentida] = '111111'
		   @stuid = session[:studentida]
		   @status = Borrowreturn.find(:all , :conditions =>{:studentid => 0})
    		end	
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

        def loginsuccess
		@stuid = session[:studentid] 
        end

      # %td= link_to "Remove",:controller=>"useraccess",:action => "main",:id => user.id
end
