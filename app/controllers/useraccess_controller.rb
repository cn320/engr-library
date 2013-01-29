class UseraccessController < ApplicationController

	def index
	end
	
	def accessuser
      if user = Userlist.authenticate(params[:studentids])
      session[:user_id] = user.stucolid
      redirect_to "/useracess/popup", :notice => 'login succeed'
    else
      flash[:notice] = 'login failed'
      redirect_to :back
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
