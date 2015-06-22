require 'powered_wunderground/version'
require 'powered_wunderground/connection'

module PoweredWunderground
  VERSION = '0.0.1'

  class << self
    attr_accessor :api_key

    def new(api_key)
      PoweredWunderground::Connection.new(api_key)
    end
  end
end
