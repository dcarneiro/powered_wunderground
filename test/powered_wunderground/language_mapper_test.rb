require File.expand_path('../../test_helper', __FILE__)
require 'powered_wunderground/language_mapper'

module PoweredWunderground
  describe PoweredWunderground do
    include LanguageMapper

    def setup
      @api_key = 'my_awesome_key'
      @conn = PoweredWunderground.new(@api_key)
    end

    def test_base_api_url
      assert_equal @conn.base_api_url, "http://api.wunderground.com/api/my_awesome_key/"
    end

    def test_fetch_with_map
      assert_equal @conn.fetch_language('pt') , 'BR'
    end

    def test_fetch_without_map
      assert_equal @conn.fetch_language('en') , 'EN'
    end
  end
end
