class AccountsController < ApplicationController
before_filter :authenticate_user!

def deposite
	binding.pry
end

end
