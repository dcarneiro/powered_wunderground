require File.expand_path('../../test_helper', __FILE__)

module PoweredWunderground
  describe Connection do
    def setup
      @conn = PoweredWunderground.new('my_awesome_key')
    end

    def test_map_language
      @conn.language = 'pt'
      assert_equal 'BR', @conn.language
    end
  end
end