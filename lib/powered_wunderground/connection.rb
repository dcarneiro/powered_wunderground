module PoweredWunderground
  class Connection
    attr_accessor :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def base_api_url
      "http://api.wunderground.com/api/#{api_key}/"
    end
  end
end
