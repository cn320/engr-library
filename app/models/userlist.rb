class Userlist < ActiveRecord::Base

  def Userlist.loginstudent studentid
	z = studentid.to_i() # studentid is String
    if user = Userlist.find_by_stucolid(z)
      if z == user.stucolid
        user
      end
    end
  end
end
