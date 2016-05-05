namespace :twitter do
  desc 'Nukes the User and Tweet tables'
  task clear: :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  task stats: :environment do
    puts "Users: #{User.count}, Tweets: #{Tweet.count}"
  end

  desc 'Populate Tweet and User tables with Faker data'
  task :populate, [:user_count] => :environment do |_t, args|
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
    Rake::Task['twitter:stats'].invoke
  end

  # rake twitter:search[microsoft,50]
  desc 'Retrieve some number of tweets from Twitter matching the search term'
  task :search, [:query, :limit] => :environment do |_t, _args|
    # Toms cool super code
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    end

    results = client.search('#' + _args[:query], result_type: 'recent').take(_args[:limit].to_i).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
    puts results
  end
end
