class TestController < ApplicationController

	def index
		if not session[:testid] 
			session[:testid] = "test id"
		end
	end
	
end
