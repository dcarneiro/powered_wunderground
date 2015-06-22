require 'minitest/autorun'
require 'powered_wunderground/language_mapper'

module PoweredWunderground
  describe PoweredWunderground do
    include LanguageMapper

    def setup
      @conn = PoweredWunderground.new('api_key')
    end

    def test_fetch_with_map
      assert_equal @conn.fetch('pt') , 'BR'
    end

    def test_fetch_without_map
      assert_equal @conn.fetch('en') , 'EN'
    end
  end
end
