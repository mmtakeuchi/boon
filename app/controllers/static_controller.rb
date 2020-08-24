class StaticController < ApplicationController
    def index
        # @user = User.find_by_id(params[:id])

        # client = IEX::Api::Client.new(
        #     publishable_token: ENV['IEX-PUBLISHABLE'],
        #     endpoint: 'https://sandbox.iexapis.com/stable'
        #     )
    end

    def search(ticker)
        # BASE_URL = 'https://sandbox.iexapis.com/stable'
        # data = requests.get(base_url+"stock/#{ticker}/quote"+"?token=#{ENV['IEX-PUBLISHABLE']}")
    end
end