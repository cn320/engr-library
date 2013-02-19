class UseraccessController < ApplicationController

	def index
	end
	
	def accessuser
      	if @x = Userlist.loginstudent(params[:studentids])
	 session[:studentname] = Userlist.getstudentname(params[:studentids])
         session[:studentid] = params[:studentids]

	 
         redirect_to "/useraccess/loginsuccess"
	#if user = Userlist.find_by_stucolid(params[:studentids])
	#	@x = user.stucolid #Fixnum
	#	@y = params[:studentids] #String
    #    if @y.to_i() == @x
	#		redirect_to "/useraccess/popup"
	#  	else
	#		@z = "ERROR IN DEEP"
	#	    redirect_to "/useraccess/accessuser"
	#    end	
	  else
        flash[:notice] = 'login failed'
      	@z = "NO LOGIN"
      	redirect_to "/useraccess/index"
      end
	end

	def createnewuser
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
