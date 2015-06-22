require 'powered_wunderground/language_mapper'

module PoweredWunderground
  class Connection
    include LanguageMapper

    attr_reader :api_key
    attr_accessor :language

    def initialize(api_key)
      @api_key = api_key
      @language = 'en'
    end

    def base_api_url
      "http://api.wunderground.com/api/#{api_key}/"
    end

    def forecast(country, city)
      wunderground_response = wunderground_forecast(country, city)
    end

    def language
      @language || 'EN'
    end

    def language=(code)
      @language = fetch_language(code)
    end

    private

    def wunderground_forecast(country, city)
      conn = Faraday.new(url: base_api_url)
      response = conn.get "forecast/lang:#{language}/q/#{country}/#{city}.json"
      JSON.parse response.body
    end
  end
end
