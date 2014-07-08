class UsersController < ApplicationController
	def new
		@user=User.new
	end

  	def create
  	@user = User.new(user_params)
	  	if @user.save
	  		sign_in @user
	  		redirect_to @user
	  	else
	  		render 'new'
	  	end
 	end

	def show
		@user=User.find(params[:id])
		@created_events = @user.created_events
		@invitations = @user.invitations
		
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
