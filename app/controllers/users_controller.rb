class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweet = @user.tweets
  end
end
