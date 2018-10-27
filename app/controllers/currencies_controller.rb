class CurrenciesController < ApplicationController
  def index
  	@currencies = CoinMarket::Ticker.all[0..10]
  	p @currencies
  end
end
