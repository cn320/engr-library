class BookdbsController < ApplicationController
  def index
	#@bookdbs = Bookdb.all
  end
  
  def new
	@bookdb = Bookdb.new
  end

  def create
	@bookdb = Bookdb.create!(params[:bookdb])
	flash[:notice] = "New Book Created"
	redirect_to bookdbs_path
  end
  def login
    if user = Adminlist.authenticate(params[:username],params[:password])
      session[:user_id] = user.id
      redirect_to "/bookdbs/useraccess", :notice => 'login succeed'
    else
      flash[:notice] = 'login failed'
      redirect_to :back
    end
  end
  def createacc
    if(!Adminlist.find_by_username(params[:username]))
    	@newacc = Adminlist.create!(:username=>params[:username],:password=>params[:password])
    	flash[:notice] = "#{@newacc.username} added"
    	redirect_to "/bookdbs/created"
    else
        flash[:notice] = "Username has been taken. please re-inform."
        redirect_to "/bookdbs/createaccount"
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to login_url, :alert => 'loged out'
  end

end
