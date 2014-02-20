class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def create
    # debugging
    render text: params[:post].inspect
  end

  def index
  end

  def new
    @tweet = Tweet.new
  end
  
  
  
  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
  
end
