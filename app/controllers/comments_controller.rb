class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
       redirect_to "/tweets/#{@comment.tweet_id}"
    else
       @tweet = Tweet.find(params[:tweet_id])
       @comments = @tweet.comments
       render "tweets/show"
    end
  end
  private
   def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id,tweet_id: params[:tweet_id])
   end
end
