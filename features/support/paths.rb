
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
	
	when /^the AddBookpage/ then '/addbook/index'	
	when /^the Popup page/ then '/addbook/popup'
	when /^the DeleteBookPage/ then '/delete/index'
	when /^the book details page/ then '/delete/index'
	when /^the borrowreturnpage/ then '/useraccess/main'
	when /^the ChargePrice page/ then '/changeprice/index'
        when /^the borrow page/ then '/useraccess/main'


    #when /^the (RottenPotatoes )?home\s?page$/ then '/movies'
    #when /^the movies page$/ then '/movies'

   
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
