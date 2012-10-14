class UsersController < ApplicationController
	respond_to :html, :xml, :js

	def index
		@user = User.new
		@user = User.where(params[:user])
		# if @user.present?
		# 	respond_with(@users, :location => todo_lists_url)
		# else
		# 	flash[:error] = "sorry email doesnt exist in the system"
		# 	redirect_to user_url
		# end
	end

	def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "New user succesfully created."
      respond_with(@user, :location => todo_lists_url)
    else
      flash[:error] = "Sorry you email is not correct"
      redirect_to new_user_url
    end
  end
end
