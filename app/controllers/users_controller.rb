class UsersController < ApplicationController


def home 
  render({ :template => "user_templates/index.html" })
end

end
