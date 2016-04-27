class TweetController < ApplicationController
  def home
    @tweet = Tweet.all;
  end
end
