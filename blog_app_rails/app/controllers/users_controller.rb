class UsersController < ApplicationController
	# before_action :logged_in?, only: [:show]
	
	def new
		@user = User.new
	end

  def create
    user = User.new(user_params)
    if user.save
      login user
	  redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

	def show
		render :show
	end

 	private

	    def user_params
	      params.require(:user).permit(:email, :password, :password_confirmation)
	    end

end
