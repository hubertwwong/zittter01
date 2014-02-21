class TweetsController < ApplicationController

  # devise to protect user...
  before_filter :authenticate_user!

  def create
    # using strong params create the object.
    @tweet = Tweet.new(tweet_params)
    # add user id
    @tweet.user_id = current_user.id
    
    # saving and redirect to index page.
    @tweet.save
    
    # go back to index page.
    redirect_to tweets_path
    
    # debugging
    #render text: ">>" + @tweet.content + " " + @tweet.user_id.to_s
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
 
    redirect_to tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  # need to make this public...
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  
  
  private

  # strong params..
  # new to rails 4.
  # basically you have to explictly permit params.
  # probably don't want the user_id to be allowed.
  # devise should be keeping track of this for you
  def tweet_params
    params.require(:tweet).permit(:content)
  end
  
end
