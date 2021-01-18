
  class TweetsController < ApplicationController
    before_action :move_to_index, except: [:index,:search]
    def index
      @tweets = Tweet.includes(:user).order("created_at DESC")
    end
  
    def new
      # @tweet = Tweet.new
      @tweet = Tweet.new
    end
  
    def create
         @tweet = Tweet.new(tweet_tag_params)
      if @tweet.save
         redirect_to root_path   
      else
         render :new
      end
    end
  
    def show
      @tweet = Tweet.find(params[:id])
    end
    
    def destroy
        @tweet = Tweet.find(params[:id])
     if @tweet.destroy
        redirect_to root_path  #user/showに渡したい
     else
        render 'user/show'
     end
    end
  
    def edit
      @tweet = Tweet.find(params[:id])
    end
  
    def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update(tweet_params)
        redirect_to root_path
      else
        render :edit
      end
    end
  
    def search
      @tweets = Tweet.search(params[:keyword])
    end
  
    private
    def tweet_tag_params
      params.require(:tweet).permit(:title, :text, :image, ).merge(user_id: current_user.id)
    end
  
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
  
  end

