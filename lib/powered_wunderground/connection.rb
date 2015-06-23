require 'powered_wunderground/language_mapper'

module PoweredWunderground
  class Connection
    include LanguageMapper

    attr_reader :api_key
    attr_accessor :language
    attr_accessor :units

    def initialize(api_key)
      @api_key = api_key
      @language = 'en'
    end

    def base_api_url
      "http://api.wunderground.com/api/#{api_key}/"
    end

    def coord(latitude, longitude)
      geo_response = wunderground_geolookup(latitude, longitude)
      city = geo_response['location']['city']
      country = geo_response['location']['country']
      w_response = wunderground_coord_forecast(latitude, longitude)
      hash = w_response['forecast']['txt_forecast']['forecastday'].first
      Response.new(country, city, hash)
    end

    def city(country, city)
      w_response = wunderground_city_forecast(country, city)
      hash = w_response['forecast']['txt_forecast']['forecastday'].first
      Response.new(country, city, hash)
    end

    def forecast(country, city)
      w_response = wunderground_forecast(country, city)
      w_response['forecast']['txt_forecast']['forecastday'].first
    end

    def language
      @language || 'EN'
    end

    def language=(code)
      @language = fetch_language(code)
    end

    private

    def wunderground_city_forecast(country, city)
      url_suffix = "forecast/lang:#{language}/q/#{country}/#{city}.json"
      response = wunderground_conn.get url_suffix
      JSON.parse response.body
    end

    def wunderground_coord_forecast(latitude, longitude)
      url_suffix = "forecast/#{coord_url_part(latitude, longitude)}"
      response = wunderground_conn.get url_suffix
      JSON.parse response.body
    end

    def wunderground_geolookup(latitude, longitude)
      url_suffix = "geolookup/#{coord_url_part(latitude, longitude)}"
      response = wunderground_conn.get url_suffix
      JSON.parse response.body
    end

    def coord_url_part(latitude, longitude)
      "lang:#{language}/q/#{latitude},#{longitude}.json"
    end

    def wunderground_conn
      Faraday.new(url: base_api_url)
    end
  end
end
