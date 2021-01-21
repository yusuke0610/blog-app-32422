class UsersController < ApplicationController
  def show
       @user = User.find(params[:id])
       @tweet = @user.tweets
    if current_user
      
    end
  end
end
