require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'


get "/" do
  erb :home
end

get "/stocks" do
  @stock_code = params[:stock_code]

  @result = YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock_code)
  @last_trade = @result[@stock_code].lastTrade


  erb :results
end
