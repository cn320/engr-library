class Userlist < ActiveRecord::Base

  def Userlist.loginstudent studentid
	z = studentid.to_i() # studentid is String
    if user = Userlist.find_by_stucolid(z)
      if z == user.stucolid
        user
      end
    end
  end

  def Userlist.getstudentname studentid
     z = studentid.to_i()
     user = Userlist.find_by_stucolid(z)
     studentname = user.name
     studentsur = user.surname
     return studentname+" "+studentsur
  end
end
