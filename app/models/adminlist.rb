class Adminlist < ActiveRecord::Base
  
  	def Adminlist.authenticate username, password
    		if user = Adminlist.find_by_username(username)
      			if password == user.password 
        			user
      			end
    		end
  	end
end
