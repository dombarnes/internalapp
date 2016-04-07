module Authlogic
  module TestHelper
    # You can call this anything you want, I chose this name as it was similar
    # to how AuthLogic calls it's objects and methods
    def create_user_session(user)
      # Assuming you have this defined in your routes, otherwise just use:
      #   '/your_login_path'
      post login_path, login: user.login, password: user.password
    end
  end
end
