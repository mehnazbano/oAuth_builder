class CurrenciesController < ApplicationController
  caches_action :index, expires_in: 5.minutes
  def index
  	@currencies = CoinMarket::Ticker.all[0..9]
  end
end
