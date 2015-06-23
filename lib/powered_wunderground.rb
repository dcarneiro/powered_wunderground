require 'powered_wunderground/version'
require 'powered_wunderground/connection'

module PoweredWunderground
  class << self

    def new(args)
      extra_params = {}

      if args.is_a?(String)
        start_conection_by_api_key(args)
      else
        start_conection_by_hash(args)
      end
    end

    def start_conection_by_api_key(api_key)
      PoweredWunderground::Connection.new(api_key)
    end

    def start_conection_by_hash(hash)
      api_key = hash[:api_key]
      fail "invalid api key #{api_key}" if api_key.nil?
      conn = PoweredWunderground::Connection.new(api_key)
      conn.language = hash[:language] if hash[:language]
      conn
    end
  end
end
