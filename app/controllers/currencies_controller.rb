class CurrenciesController < ApplicationController
	# maintaining action caache for 5 minutes as API data updates every 5 minutes
  caches_action :index, expires_in: 5.minutes
  def index
  	# Using CoinMarket API to fetch crypto currency data.
  	@currencies = CoinMarket::Ticker.all[0..9]
  	# Expecting different response for different kind of call.
  	respond_to do |format|
  		format.json { render json: @currencies } # For Testing purpose
		  format.html # show.html.slim
    end
  end
end
