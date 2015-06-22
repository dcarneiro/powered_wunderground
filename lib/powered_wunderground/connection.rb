require 'powered_wunderground/language_mapper'

module PoweredWunderground
  class Connection
    include LanguageMapper

    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def base_api_url
      "http://api.wunderground.com/api/#{api_key}/"
    end

    def forecast(country, city)
      wunderground_response = wunderground_forecast(country, city)
    end

    def language_code
      @language_code || 'EN'
    end

    private

    def wunderground_forecast(country, city)
      conn = Faraday.new(url: base_api_url)
      response = conn.get "forecast/lang:#{language_code}/q/#{country}/#{city}.json"
      JSON.parse response.body
    end
  end
end
