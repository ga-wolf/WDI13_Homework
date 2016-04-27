namespace :twitter do
  desc "Nukes the User and Tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  task :stats => :environment do
    puts "Users: #{ User.count }, Tweets: #{Tweet.count}"
  end

  desc "Populate Tweet and User tables with faker data"
  task :populate, [:user_count] => :environment do |t, args|
    FactoryGirl.create_list :user_with_tweets,args[:user_count].to_i
    Rake::Task['twitter:stats'].invoke
  end

  # rake twitter:search[microsoft, 50];]
  desc "Retrieve some number of tweets from twitter matching the search term"
  task :search, [:query, :limit] => :environment do |t, args|
   OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
     client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "lGkaexxvXyTTbh5zeJBeoDXAR"
      config.consumer_secret     = "Q0BKWVigzkh6tIVM0HKhtnP3NfeOBHRtGQ1T4MzV9Op1srcBci"
      #config.bearer_token "AAAAAAAAAAAAAAAAAAAAABZquwAAAAAAqWWuxwcC%2FWgmoP8%2Bm6McO0Ntq%2F8%3DriTqEJCgrA4Smm1St5wKrObZVlQIwZ76OqlPYIban2pjx9bSAE"
      config.access_token        = "270240066-F71xQ1dnAMY5M84cyujsTQj6Sl1wmXu2Xso3A3qm"
      config.access_token_secret = "Y7lNWNMF5EHchcJYdGgOkbChJ93GcZde4x0kTe7s0zBjX"
    end

    #puts client.user("KateUpton")
    #puts client.bearer_token

   client.search(args[:query]).take(args[:limit].to_i).each do |tweet|
     puts(tweet.text, tweet.user.screen_name)
     Tweet.create(post: tweet.text)
end
  end


end
